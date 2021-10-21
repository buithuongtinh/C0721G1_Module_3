package model.repositories.impl;

import model.bean.Product;
import model.repositories.DBConnection;
import model.repositories.IProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements IProductRepository {

    private static final String SELECT_ALL_PRODUCT = "SELECT * FROM product " +
            "JOIN category ON product.category_id = category.category_id;";
    private static final String INSERT_NEW_PRODUCT = "INSERT INTO product (product_name, product_price, product_quantity," +
            "product_color, product_description, category_id) VALUES (?, ?, ?, ?, ?, ?);";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT * FROM product " +
            "JOIN category ON product.category_id = category.category_id WHERE product_id = ?;";
    private static final String EDIT_PRODUCT = "UPDATE product SET product_name = ?, product_price = ?, " +
            "product_quantity = ?, product_color = ?, product_description = ?, category_id = ? WHERE product_id = ?;";
    private static final String DELETE_PRODUCT = "DELETE FROM product WHERE product_id = ?;";
    private static final String SEARCH_PRODUCT_BY_NAME = "SELECT * FROM product " +
            "JOIN category ON product.category_id = category.category_id WHERE product_name LIKE ?;";
    private static final String SEARCH_PRODUCT_BY_CATEGORY_ID = "SELECT * FROM product " +
            "JOIN category ON product.category_id = category.category_id WHERE product.category_id = ?;";

    @Override
    public List<Product> getAllProduct() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Product> productList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);
                resultSet = preparedStatement.executeQuery();
                Product product = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("product_id");
                    String name = resultSet.getString("product_name");
                    double price = resultSet.getDouble("product_price");
                    int quantity = resultSet.getInt("product_quantity");
                    String color = resultSet.getString("product_color");
                    String description = resultSet.getString("product_description");
                    int categoryId = resultSet.getInt("category_id");
                    String categoryName = resultSet.getString("category_name");
                    product = new Product(id, name, price, quantity, color, description, categoryId, categoryName);
                    productList.add(product);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return productList;
    }

    @Override
    public Product selectProductById(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Product product = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
                preparedStatement.setInt(1, id);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    String name = resultSet.getString("product_name");
                    double price = resultSet.getDouble("product_price");
                    int quantity = resultSet.getInt("product_quantity");
                    String color = resultSet.getString("product_color");
                    String description = resultSet.getString("product_description");
                    int categoryId = resultSet.getInt("category_id");
                    String categoryName = resultSet.getString("category_name");
                    product = new Product(id, name, price, quantity, color, description, categoryId, categoryName);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return product;
    }

    @Override
    public void creatNewProduct(Product product) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(INSERT_NEW_PRODUCT);
                preparedStatement.setString(1, product.getName());
                preparedStatement.setDouble(2, product.getPrice());
                preparedStatement.setInt(3, product.getQuantity());
                preparedStatement.setString(4, product.getColor());
                preparedStatement.setString(5, product.getDescription());
                preparedStatement.setInt(6, product.getCategoryId());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }

    }

    @Override
    public void editProduct(Product product) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(EDIT_PRODUCT);
                preparedStatement.setString(1, product.getName());
                preparedStatement.setDouble(2, product.getPrice());
                preparedStatement.setInt(3, product.getQuantity());
                preparedStatement.setString(4, product.getColor());
                preparedStatement.setString(5, product.getDescription());
                preparedStatement.setInt(6, product.getCategoryId());
                preparedStatement.setInt(7, product.getId());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public void deleteProduct(int id) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(DELETE_PRODUCT);
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public List<Product> searchProductByName(String search) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Product> productList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SEARCH_PRODUCT_BY_NAME);
                String searchSQL = search.concat("%");
                preparedStatement.setString(1, searchSQL);
                resultSet = preparedStatement.executeQuery();
                Product product = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("product_id");
                    String name = resultSet.getString("product_name");
                    double price = resultSet.getDouble("product_price");
                    int quantity = resultSet.getInt("product_quantity");
                    String color = resultSet.getString("product_color");
                    String description = resultSet.getString("product_description");
                    int categoryId = resultSet.getInt("category_id");
                    String categoryName = resultSet.getString("category_name");
                    product = new Product(id, name, price, quantity, color, description, categoryId, categoryName);
                    productList.add(product);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return productList;
    }

    @Override
    public List<Product> searchProductByCategory(int categoryId) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Product> productList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SEARCH_PRODUCT_BY_CATEGORY_ID);
                preparedStatement.setInt(1, categoryId);
                resultSet = preparedStatement.executeQuery();
                Product product = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("product_id");
                    String name = resultSet.getString("product_name");
                    double price = resultSet.getDouble("product_price");
                    int quantity = resultSet.getInt("product_quantity");
                    String color = resultSet.getString("product_color");
                    String description = resultSet.getString("product_description");
                    String categoryName = resultSet.getString("category_name");
                    product = new Product(id, name, price, quantity, color, description, categoryId, categoryName);
                    productList.add(product);

                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return productList;
    }
}
