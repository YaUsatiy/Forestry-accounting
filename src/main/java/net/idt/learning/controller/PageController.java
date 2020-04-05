package net.idt.learning.controller;

import net.idt.learning.dao.*;
import net.idt.learning.dto.*;
import net.idt.learning.exception.LoggerNotFoundException;
import net.idt.learning.exception.ProductNotFoundException;
import net.idt.learning.model.UserModel;
import net.idt.learning.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;

@Controller
public class PageController {
    @Autowired
    private CategoryDao categoryDao;
    @Autowired
    private ProductDao productDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private OrderDetailDao orderDetailDao;
    @Autowired
    private ReviewDao reviewDao;
    @Autowired
    private ProductService productService;
    @Autowired
    private LoggerDao loggerDao;
    @Autowired
    private HttpSession session;

    @GetMapping(value = {"/", "/home", "/index"})
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "Home");
        mv.addObject("categories", categoryDao.list());
        mv.addObject("purchasedProducts", productDao.getMostPurchasedProducts(5));
        mv.addObject("viewedProducts", productDao.getMostViewedProducts(5));
        mv.addObject("topLoggers", loggerDao.limitedList(3));
        mv.addObject("userClickHome", true);
        return mv;
    }

    @GetMapping("/about")
    public ModelAndView about() {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "About Us");
        mv.addObject("userClickAbout", true);
        return mv;
    }

    @GetMapping("/contact")
    public ModelAndView contact() {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "Contact Us");
        mv.addObject("userClickContact", true);
        return mv;
    }

    @GetMapping("/show/all/products")
    public ModelAndView showAllProducts() {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "All products");
        mv.addObject("categories", categoryDao.list());
        mv.addObject("userClickAllProducts", true);
        return mv;
    }

    @GetMapping("/show/category/{id}/products")
    public ModelAndView showCategoryProducts(@PathVariable int id) {
        ModelAndView mv = new ModelAndView("page");
        Category category = null;
        category = categoryDao.get(id);
        mv.addObject("title", category.getName());
        mv.addObject("category", category);
        mv.addObject("categories", categoryDao.list());
        mv.addObject("userClickCategoryProducts", true);
        return mv;
    }

    @GetMapping("/show/{id}/product")
    public ModelAndView showSingleProduct(@PathVariable int id) throws ProductNotFoundException {
        ModelAndView mv = new ModelAndView("page");
        Product product = null;
        product = productDao.get(id);
        if (product == null) {
            throw new ProductNotFoundException();
        }
        product.setViews(product.getViews() + 1);
        productDao.update(product);
        mv.addObject("title", product.getName());
        mv.addObject("product", product);
        mv.addObject("userClickShowProduct", true);
        mv.addObject("topProducts", productDao.getTopViewedProducts(id, 4));
        return mv;
    }

    @RequestMapping(value = {"/login"})
    public ModelAndView login(@RequestParam(name="error", required = false)String error,
                              @RequestParam(name="logout", required = false)String logout) {
        ModelAndView mv = new ModelAndView("login");
        if (error != null) {
            mv.addObject("message", "Invalid username or password!");
        }
        if (logout != null) {
            mv.addObject("message", "User has successfully logged out!");
        }
        mv.addObject("title", "Login");
        return mv;
    }

    @RequestMapping(value = "/access-denied")
    public ModelAndView accessDenied() {
        ModelAndView mv = new ModelAndView("error");
        mv.addObject("errorTitle", "Good try, rogue");
        mv.addObject("errorDescription", "You are not authorized to view this page!");
        mv.addObject("title", "403 Access Denied");
        return mv;
    }

    @RequestMapping(value = "/perform-logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }
        return "redirect:/login?logout";
    }

    @GetMapping("/user/myOrders")
    public ModelAndView userOrders() {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "My Orders");
        mv.addObject("userClickMyOrders", true);
        User user = userDao.getByEmail(((UserModel)session.getAttribute("userModel")).getEmail());
        mv.addObject("orders", userDao.getOrders(user));
        return mv;
    }

    @GetMapping("/user/myReviews")
    public ModelAndView userReviews() {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "My Reviews");
        mv.addObject("userClickMyReviews", true);
        User user = userDao.getByEmail(((UserModel)session.getAttribute("userModel")).getEmail());
        mv.addObject("reviews", reviewDao.listByUser(user));
        mv.addObject("notShow", true);
        Review review = new Review();
        mv.addObject("review", review);
        return mv;
    }

    @GetMapping("/show/invoice/{id}")
    public ModelAndView showInvoice(@PathVariable("id") int id) {
        ModelAndView mv;
        OrderDetail orderDetail = orderDetailDao.get(id);
        String email = ((UserModel)session.getAttribute("userModel")).getEmail();
        String role = ((UserModel)session.getAttribute("userModel")).getRole();
        if (email.equals(orderDetail.getUser().getEmail()) || role.equalsIgnoreCase("admin")) {
            mv = new ModelAndView("/flows/cart/checkout/order-confirm");
            mv.addObject("orderDetail", orderDetail);
        } else {
            mv = new ModelAndView("/flows/cart/checkout/notForYou");
        }
        return mv;
    }

    @GetMapping("/show/product/{id}/reviews")
    public ModelAndView showReviews(@PathVariable("id") int id, @RequestParam(name = "result", required = false) String result) {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "Reviews");
        mv.addObject("userClickReviews", true);
        Product product = productDao.get(id);
        mv.addObject("reviews", reviewDao.listByProduct(product));
        Review review = new Review();
        review.setProduct(product);
        mv.addObject("review", review);
        if (result != null) {
            mv.addObject("message", "Review was successfully added!");
        }
        return mv;
    }

    @PostMapping("/user/product/{id}/add/review")
    public String addReview(@Valid @ModelAttribute("review") Review review, BindingResult results, Model model, @PathVariable int id) {
        if (results.hasErrors()) {
            model.addAttribute("title", "Reviews");
            model.addAttribute("userClickReviews", true);
            return "page";
        }
        review.setReviewDate(new Date());
        User user = userDao.get(((UserModel)session.getAttribute("userModel")).getId());
        review.setUser(user);
        Product product = productDao.get(id);
        review.setProduct(product);
        reviewDao.add(review);
        productService.updateRatingAdd(product);
        return "redirect:/show/product/" + id + "/reviews?result=success";
    }

    @GetMapping("/show/all/loggers")
    public ModelAndView showAllLoggers() {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "All loggers");
        mv.addObject("userClickAllLoggers", true);
        return mv;
    }

    @GetMapping("/show/{id}/logger")
    public ModelAndView showSingleLogger(@PathVariable int id) throws LoggerNotFoundException {
        ModelAndView mv = new ModelAndView("page");
        Logger logger = loggerDao.get(id);
        if (logger == null) {
            throw new LoggerNotFoundException();
        }
        logger.setViews(logger.getViews() + 1);
        loggerDao.update(logger);
        mv.addObject("title", logger.getName());
        mv.addObject("logger", logger);
        mv.addObject("userClickShowLogger", true);
        mv.addObject("topLoggers", loggerDao.getTopViewedLoggers(id, 3));
        return mv;
    }

}
