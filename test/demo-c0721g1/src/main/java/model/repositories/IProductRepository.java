package model.repositories;

import model.bean.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductRepository {

    List<Product> getAllProduct ();
    Product selectProductById (int id);
    void creatNewProduct (Product product) throws SQLException;
    void editProduct (Product product) throws SQLException;
    void deleteProduct (int id) throws SQLException;
    List<Product> searchProductByName (String search);
    List<Product> searchProductByCategory (int categoryId);
}
