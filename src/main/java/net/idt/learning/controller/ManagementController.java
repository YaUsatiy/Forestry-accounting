package net.idt.learning.controller;

import net.idt.learning.dao.*;
import net.idt.learning.dto.Category;
import net.idt.learning.dto.Logger;
import net.idt.learning.dto.Product;
import net.idt.learning.dto.Review;
import net.idt.learning.service.OrderService;
import net.idt.learning.service.ProductService;
import net.idt.learning.util.FileUtil;
import net.idt.learning.util.LoggerImageValidator;
import net.idt.learning.util.ProductImageValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/manage")
public class ManagementController {
    @Autowired
    private CategoryDao categoryDao;
    @Autowired
    private ProductDao productDao;
    @Autowired
    private OrderDetailDao orderDetailDao;
    @Autowired
    private ReviewDao reviewDao;
    @Autowired
    private LoggerDao loggerDao;
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderService orderService;

    @GetMapping("/products")
    public ModelAndView showManageProducts(@RequestParam(name="operation", required = false)String operation) {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "Product Management");
        mv.addObject("userClickManageProducts", true);
        Product product = new Product();
        product.setSupplierId(1);
        product.setActive(true);
        mv.addObject("product", product);
        if (operation != null) {
            if (operation.equals("product")) {
                mv.addObject("message", "Product submitted successfully!");
            } else if (operation.equals("category")) {
                mv.addObject("message", "Category submitted successfully!");
            }
        }
        return mv;
    }

    @PostMapping("/products")
    public String handleProductSubmission(@Valid @ModelAttribute("product") Product product, BindingResult results, Model model,
                                          HttpServletRequest request) {
        if (product.getId() == 0) {
            new ProductImageValidator().validate(product, results);
        } else {
            if (!product.getFile().getOriginalFilename().equals("")) {
                new ProductImageValidator().validate(product, results);
            }
        }
        if (results.hasErrors()) {
            model.addAttribute("title", "Product Management");
            model.addAttribute("userClickManageProducts", true);
            return "page";
        }
        if (product.getId() == 0) {
            //new product
            productDao.add(product);
        } else {
            //existing product
            productDao.update(product);
        }
        if (!product.getFile().getOriginalFilename().equals("")) {
            FileUtil.uploadFile(request, product.getFile(), product.getCode());
        }
        return "redirect:/manage/products?operation=product";
    }

    @GetMapping("/{id}/product")
    public ModelAndView showEditProduct(@PathVariable int id) {
        Product product = productDao.get(id);
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "Product Management");
        mv.addObject("userClickManageProducts", true);
        mv.addObject("product", product);
        return mv;
    }

    @ModelAttribute("categories")
    public List<Category> modelCategories() {
        return categoryDao.list();
    }

    @ModelAttribute("category")
    public Category modelCategory() {
        return new Category();
    }

    @GetMapping(value = "/product/{id}/activation")
    @ResponseBody
    public String managePostProductActivation(@PathVariable int id) {
        Product product = productDao.get(id);
        boolean isActive = product.isActive();
        product.setActive(!isActive);
        productDao.update(product);
        return (isActive)? "Product Dectivated Successfully!": "Product Activated Successfully!";
    }

    @PostMapping(value = "/category")
    public String handleCategorySubmission(@ModelAttribute Category category) {
        categoryDao.add(category);
        return "redirect:/manage/products?operation=category";
    }

    @RequestMapping(value = "/orders")
    public ModelAndView manageOrders() {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "Orders Management");
        mv.addObject("userClickManageOrders", true);
        mv.addObject("orders", orderDetailDao.list());
        mv.addObject("ordersSum", orderService.getOrdersSum());
        mv.addObject("ordersCount", orderDetailDao.list().size());
        return mv;
    }

    @RequestMapping(value = "/reviews")
    public ModelAndView manageReviews(@RequestParam(name = "result", required = false) String result) {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "Reviews Management");
        mv.addObject("userClickManageReviews", true);
        mv.addObject("reviews", reviewDao.list());
        if (result != null) {
            mv.addObject("message", "Review was successfully deleted!");
        }
        return mv;
    }

    @GetMapping(value = "/review/{id}/delete")
    public String deleteReview(@PathVariable int id) {
        Review review = reviewDao.get(id);
        productService.updateRatingDelete(review.getProduct());
        reviewDao.delete(review);
        return "redirect:/manage/reviews?result=success";
    }

    @PostMapping("/loggers")
    public String handleLoggerSubmission(@Valid @ModelAttribute("logger")Logger logger, BindingResult results, Model model,
                                         HttpServletRequest request) {
        if (logger.getId() == 0) {
            new LoggerImageValidator().validate(logger, results);
        } else {
            if (!logger.getFile().getOriginalFilename().equals("")) {
                new LoggerImageValidator().validate(logger, results);
            }
        }
        if (results.hasErrors()) {
            model.addAttribute("title", "Logger Management");
            model.addAttribute("userClickManageLoggers", true);
            return "page";
        }
        if (logger.getId() == 0) {
            //new logger
            loggerDao.add(logger);
        } else {
            //existing logger
            loggerDao.update(logger);
        }
        if (!logger.getFile().getOriginalFilename().equals("")) {
            FileUtil.uploadFile(request, logger.getFile(), logger.getCode());
        }
        return "redirect:/manage/loggers?operation=true";
    }

    @GetMapping("/loggers")
    public ModelAndView showManageLoggers(@RequestParam(name="operation", required = false)String operation) {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "Logger Management");
        mv.addObject("userClickManageLoggers", true);
        Logger logger = new Logger();
        mv.addObject("logger", logger);
        if (operation != null) {
            mv.addObject("message", "Logger submitted successfully!");
        }
        return mv;
    }

    @GetMapping("/{id}/logger")
    public ModelAndView showEditLogger(@PathVariable int id) {
        Logger logger = loggerDao.get(id);
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "Logger Management");
        mv.addObject("userClickManageLoggers", true);
        mv.addObject("logger", logger);
        return mv;
    }
}
