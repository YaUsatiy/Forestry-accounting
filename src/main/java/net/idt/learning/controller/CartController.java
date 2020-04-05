package net.idt.learning.controller;

import net.idt.learning.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;

    @GetMapping("/show")
    public ModelAndView showCart(@RequestParam(name = "result", required = false) String result) {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "Shopping Cart");
        mv.addObject("userClickShowCart", true);
        if(result!=null) {
            switch(result) {
                case "added":
                    mv.addObject("message", "Product has been successfully added inside cart!");
                    cartService.validateCartLine();
                    break;
                case "unavailable":
                    mv.addObject("message", "Product quantity is not available!");
                    break;
                case "updated":
                    mv.addObject("message", "Cart has been updated successfully!");
                    cartService.validateCartLine();
                    break;
                case "modified":
                    mv.addObject("message", "One or more items inside cart has been modified!");
                    break;
                case "maximum":
                    mv.addObject("message", "Maximum limit for the item has been reached!");
                    break;
                case "deleted":
                    mv.addObject("message", "CartLine has been successfully removed!");
                    break;
            }
        }
        else {
            String response = cartService.validateCartLine();
            if(response.equals("result=modified")) {
                mv.addObject("message", "One or more items inside cart has been modified!");
            }
        }
        mv.addObject("cartLines", cartService.getCartLines());
        return mv;
    }

    @RequestMapping("/{cartLineId}/update")
    public String udpateCartLine(@PathVariable int cartLineId, @RequestParam int count) {
        String response = cartService.manageCartLine(cartLineId, count);
        return "redirect:/cart/show?" + response;
    }

    @RequestMapping("/{cartLineId}/remove")
    public String removeCartLine(@PathVariable int cartLineId) {
        String response = cartService.removeCartLine(cartLineId);
        return "redirect:/cart/show?"+response;
    }

    @GetMapping("/add/{productId}/product")
    public String addCartLine(@PathVariable int productId) {
        String response = cartService.addCartLine(productId);
        return "redirect:/cart/show?"+response;
    }

    @RequestMapping("/validate")
    public String validateCart() {
        String response = cartService.validateCartLine();
        if(!response.equals("result=success")) {
            return "redirect:/cart/show?"+response;
        }
        else {
            return "redirect:/cart/checkout";
        }
    }
}
