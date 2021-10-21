package model.repositories;

import model.bean.Product;

import java.util.List;

public interface ProductRepository {

    List<Product> getAll();
    void save(Product product);

    void remove(int idProduct);
}
