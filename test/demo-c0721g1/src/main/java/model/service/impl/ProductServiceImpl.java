package model.service.impl;

import model.bean.Product;

import model.repositories.impl.ProductRepositoryImpl;
import model.service.IProductService;
import model.service.Validator;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements IProductService {
    ProductRepositoryImpl productRepository = new ProductRepositoryImpl();

    @Override
    public List<Product> getAllProduct() {
        return productRepository.getAllProduct();
    }

    @Override
    public Product selectProductById(int id) {
        return productRepository.selectProductById(id);
    }

    @Override
    public Map<String, String> creatNewProduct(Product product) throws SQLException {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validator.validateName(product.getName()) != null ||
                Validator.validatePrice(product.getPrice()) != null ||
                Validator.validateQuantity(product.getQuantity()) != null ||
                Validator.validateColor(product.getColor()) != null ||
                Validator.validateDescription(product.getDescription()) != null) {
            mapMessage.put("name", Validator.validateName(product.getName()));
            mapMessage.put("price", Validator.validatePrice(product.getPrice()));
            mapMessage.put("quantity", Validator.validateQuantity(product.getQuantity()));
            mapMessage.put("color", Validator.validateColor(product.getColor()));
            mapMessage.put("description", Validator.validateDescription(product.getDescription()));
        } else {
            productRepository.creatNewProduct(product);
        }
        return mapMessage;
    }

    @Override
    public Map<String, String> editProduct(Product product) throws SQLException {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validator.validateName(product.getName()) != null ||
                Validator.validatePrice(product.getPrice()) != null ||
                Validator.validateQuantity(product.getQuantity()) != null ||
                Validator.validateColor(product.getColor()) != null ||
                Validator.validateDescription(product.getDescription()) != null) {
            mapMessage.put("name", Validator.validateName(product.getName()));
            mapMessage.put("price", Validator.validatePrice(product.getPrice()));
            mapMessage.put("quantity", Validator.validateQuantity(product.getQuantity()));
            mapMessage.put("color", Validator.validateColor(product.getColor()));
            mapMessage.put("description", Validator.validateDescription(product.getDescription()));
        } else {
            productRepository.editProduct(product);
        }
        return mapMessage;
    }

    @Override
    public void deleteProduct(int id) throws SQLException {
        productRepository.deleteProduct(id);
    }

    @Override
    public List<Product> searchProductByName(String search) {
        return productRepository.searchProductByName(search);
    }

    @Override
    public List<Product> searchProductByCategory(int categoryId) {
        return productRepository.searchProductByCategory(categoryId);
    }
}
