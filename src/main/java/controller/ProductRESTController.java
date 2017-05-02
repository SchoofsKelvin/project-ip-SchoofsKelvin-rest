/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.Service;

/**
 *
 * @author Kelvin
 */
@Controller
@RequestMapping(value = "/rest/countries")
public class ProductRESTController {

    private final Service service;

    public ProductRESTController(@Autowired Service service) {
        this.service = service;
    }

    @RequestMapping(method = RequestMethod.GET)
    public List getProducts() {
        return service.getProducts();

    }
}
