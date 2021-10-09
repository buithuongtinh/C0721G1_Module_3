package model.service.impl;

import model.bean.Product;
import model.repository.IProductRepository;
import model.repository.impl.ProductRepositoryImpl;
import model.service.IProductService;

import java.util.List;

public class ProductServiceImpl implements IProductService {

 private IProductRepository productRepository = new ProductRepositoryImpl();


    @Override
    public List<Product> display() {
        return productRepository.display();
    }

    @Override
    public void createNew(Product product) {
        productRepository.createNew(product);
    }

    @Override
    public void updateProduct(int id, Product product) {
        productRepository.updateProduct(id, product);
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }

    @Override
    public Product showDetailInfo(int id) {
        return productRepository.showDetailInfo(id);
    }

    @Override
    public Product searchById(int id) {
        return productRepository.searchById(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return productRepository.searchByName(name);
    }
}
