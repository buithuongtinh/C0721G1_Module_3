package model.repositories.impl;

import model.bean.Product;
import model.repositories.DBConnection;
import model.repositories.ProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {

    private static String SELECT_ALL_PRODUCT = "SELECT * FROM product \n" +
            "join category on product.id_category = category.id_category;";
    private static String INSERT_PRODUCT = "INSERT INTO `democ07`.`product` (`name_product`, `price`, `status`, `id_category`) VALUES (?, ?, ?, ?);";
 private static String DELETE_PRODUCT = "delete from product where id_product = ?";
    @Override
    public List<Product> getAll() {
        Connection connection = DBConnection.getConnection();
        List<Product> productList = new ArrayList<>();
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    int idProduct = resultSet.getInt("id_product");
                    String nameProduct = resultSet.getString("name_product");
                    double price  = resultSet.getDouble("price");
                    boolean status = resultSet.getBoolean("status");
                    int idCategory = resultSet.getInt("id_category");
                    String nameCategory = resultSet.getString("name_category");
                    productList.add(new Product(idProduct, nameProduct, status,price,idCategory,nameCategory));
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }

            return productList;
        }


        return null;
    }

    @Override
    public void save(Product product) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(INSERT_PRODUCT);
                preparedStatement.setString(1,product.getNameProduct());
                preparedStatement.setDouble(2,product.getPrice());
                preparedStatement.setBoolean(3,product.isStatus());
                preparedStatement.setInt(4,product.getIdCategory());
                preparedStatement.executeUpdate();
            }catch (SQLException e){
                e.printStackTrace();
            }finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
    }

    @Override
    public void remove(int idProduct) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(DELETE_PRODUCT);
                preparedStatement.setInt(1,idProduct);
                preparedStatement.executeUpdate();
            }catch (SQLException e){
                e.printStackTrace();
            }finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
    }
}
