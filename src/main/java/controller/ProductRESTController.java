/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import domain.Product;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import service.Service;

/**
 *
 * @author Kelvin
 */
@Controller
@ResponseBody
@RequestMapping(value = "/products")
public class ProductRESTController {

    private final Service service;

    public ProductRESTController(@Autowired Service service) {
        this.service = service;
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Product> getProducts() {
        return service.getProducts();

    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(method = RequestMethod.POST)
    public Product createProduct(Product newProduct) {
        service.addProduct(newProduct);
        return newProduct;
    }
}
