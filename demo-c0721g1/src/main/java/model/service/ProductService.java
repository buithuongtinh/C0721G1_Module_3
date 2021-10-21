package model.service;

import model.bean.Product;

import java.util.List;
import java.util.Map;

public interface ProductService {

    List<Product> findAll();

    Map<String,String> create(Product product);

    void remove(int idProduct);
}
