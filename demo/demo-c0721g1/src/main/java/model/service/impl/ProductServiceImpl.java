package model.service.impl;

import model.bean.Product;
import model.repositories.ProductRepository;
import model.repositories.impl.ProductRepositoryImpl;
import model.service.ProductService;

import java.util.List;

public class ProductServiceImpl implements ProductService {

    ProductRepository productRepository = new ProductRepositoryImpl();

    @Override
    public List<Product> findAll() {
        return productRepository.getAll();
    }

    @Override
    public void create(Product product) {
        productRepository.save(product);
    }

    @Override
    public void remove(int idProduct) {
        productRepository.remove(idProduct);
    }
}
