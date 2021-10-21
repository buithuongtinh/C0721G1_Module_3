package model.service;

import model.bean.Product;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IProductService {
    List<Product> getAllProduct ();
    Product selectProductById (int id);
    Map<String, String> creatNewProduct (Product product) throws SQLException;
    Map<String, String> editProduct (Product product) throws SQLException;
    void deleteProduct (int id) throws SQLException;
    List<Product> searchProductByName (String search);
    List<Product> searchProductByCategory (int categoryId);

}
