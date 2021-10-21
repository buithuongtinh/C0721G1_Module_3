package model.service;

import model.bean.Product;

import java.util.List;

public interface ProductService {

    List<Product> findAll();

    void create(Product product);

    void remove(int idProduct);
}
