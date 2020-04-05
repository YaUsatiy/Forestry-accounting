package net.idt.learning.controller;

import net.idt.learning.dao.UserDao;
import net.idt.learning.dto.User;
import net.idt.learning.model.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;

@ControllerAdvice
public class GlobalController {
    @Autowired
    private HttpSession session;
    @Autowired
    private UserDao userDao;
    private UserModel userModel;

    @ModelAttribute("userModel")
    public UserModel getUserModel() {
        if (session.getAttribute("userModel") == null) {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            User user = userDao.getByEmail(authentication.getName());
            if (user != null) {
                userModel = new UserModel();
                userModel.setId(user.getId());
                userModel.setEmail(user.getEmail());
                userModel.setFullName(user.getFirstName() + " " + user.getLastName());
                userModel.setRole(user.getRole());
                if (user.getRole().equals("USER")) {
                    userModel.setCart(user.getCart());
                }
                session.setAttribute("userModel", userModel);
                return userModel;
            }
        }
        return (UserModel)session.getAttribute("userModel");
    }
}
