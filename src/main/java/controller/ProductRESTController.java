/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import domain.Product;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.WebRequest;
import service.Service;

/**
 *
 * @author Kelvin
 */
@Controller
@ControllerAdvice
@RestController
@RequestMapping(value = "/products")
public class ProductRESTController {

    private final Service service;

    public ProductRESTController(@Autowired Service service) {
        this.service = service;
    }

    protected static class RestException extends RuntimeException {

        public final HttpStatus status;
        public final String message;

        public RestException(HttpStatus status, String message) {
            this.status = status;
            this.message = message;
        }

    }

    @ExceptionHandler(value = RestException.class)
    protected ResponseEntity<String> handleConflict(RestException ex, WebRequest request) {
        return ResponseEntity.status(ex.status).body(ex.message);
    }

    @ExceptionHandler(value = HttpMessageNotReadableException.class)
    protected ResponseEntity<String> handleConflict(HttpMessageNotReadableException ex, WebRequest request) {
        if (ex.getCause() instanceof InvalidFormatException) {
            InvalidFormatException cause = (InvalidFormatException) ex.getCause();
            String error = "Couldn't convert %s '%s' to a %s";
            error = String.format(error, cause.getValue().getClass().getSimpleName(), cause.getValue(), cause.getTargetType().getSimpleName());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(error);
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ex.getMessage());
    }

    @ExceptionHandler(value = Exception.class)
    protected ResponseEntity<String> handleAllConflicts(Exception ex, WebRequest request) {
        ex.printStackTrace();
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ex.getMessage());
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.GET)
    public List<Product> getProducts() {
        return service.getProducts();

    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public Product getProduct(@PathVariable String id) {
        Product product = service.getProduct(id);
        if (product == null) {
            throw new RestException(HttpStatus.NOT_FOUND, "Didn't find the given product");
        }
        return product;

    }

    @ResponseBody
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(method = RequestMethod.POST)
    public Product createProduct(@RequestBody @Valid Product product, BindingResult result) {
        service.addProduct(product);
        return product;
    }

    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
    public Product updateProduct(@PathVariable String id, @RequestBody Product product) {
        if (id == null) {
            throw new RestException(HttpStatus.BAD_REQUEST, "Missing productid");
        } else if (service.getProduct(id) == null) {
            throw new RestException(HttpStatus.NOT_FOUND, "Didn't find the given product");
        }
        product.setProductid(id);
        service.updateProduct(product);
        return product;
    }

    @ResponseBody
    @ResponseStatus(HttpStatus.GONE)
    @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
    public Product deleteProduct(@PathVariable String id) {
        Product product;
        if (id == null) {
            throw new RestException(HttpStatus.BAD_REQUEST, "Missing productid");
        } else if ((product = service.getProduct(id)) == null) {
            throw new RestException(HttpStatus.NOT_FOUND, "Didn't find the given product");
        }
        service.deleteProduct(product);
        return product;
    }
}
