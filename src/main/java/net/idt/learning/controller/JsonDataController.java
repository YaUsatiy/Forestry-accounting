package net.idt.learning.controller;

import net.idt.learning.dao.LoggerDao;
import net.idt.learning.dao.ProductDao;
import net.idt.learning.dto.Logger;
import net.idt.learning.dto.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/json/data")
public class JsonDataController {
    @Autowired
    private ProductDao productDao;
    @Autowired
    private LoggerDao loggerDao;

    @GetMapping("/all/products")
    @ResponseBody
    public List<Product> getAllProducts() {
        return productDao.listActiveProducts();
    }

    @GetMapping("/admin/all/products")
    @ResponseBody
    public List<Product> getAllProductsForAdmin() {
        return productDao.list();
    }

    @GetMapping("/category/{id}/products")
    @ResponseBody
    public List<Product> getAllProductsByCategory(@PathVariable int id) {
        return productDao.listActiveProductsByCategory(id);
    }

    @GetMapping("/all/loggers")
    @ResponseBody
    public List<Logger> getAllLoggers() {
        return loggerDao.list();
    }
}
