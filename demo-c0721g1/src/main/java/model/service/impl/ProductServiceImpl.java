package model.service.impl;

import model.bean.Product;
import model.repositories.ProductRepository;
import model.repositories.impl.ProductRepositoryImpl;
import model.service.ProductService;
import model.service.common.Validator;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {

    ProductRepository productRepository = new ProductRepositoryImpl();

    @Override
    public List<Product> findAll() {
        return productRepository.getAll();
    }

    @Override
    public  Map<String, String> create(Product product) {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validator.validateName(product.getNameProduct()) != null ||
            Validator.validatePrice(product.getPrice()) != null){
            mapMessage.put("nameProduct",Validator.validateName(product.getNameProduct()));
            mapMessage.put("price",Validator.validatePrice(product.getPrice()));
        }else {
            productRepository.save(product);
        }
        return mapMessage;
    }

    @Override
    public void remove(int idProduct) {
        productRepository.remove(idProduct);
    }
}
