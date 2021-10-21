package model.repositories.impl;

import model.bean.Category;
import model.bean.Product;
import model.repositories.CategoryRepository;
import model.repositories.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepositoryImpl implements CategoryRepository {

    private static String SELECT_ALL_CATEGORY = "SELECT * FROM democ07.category;";

    @Override
    public List<Category> getAll() {
        Connection connection = DBConnection.getConnection();
        List<Category> categoryList = new ArrayList<>();
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORY);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int idCategory = resultSet.getInt("id_category");
                    String nameCategory = resultSet.getString("name_category");
                    categoryList.add(new Category(idCategory, nameCategory));
                }

            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        return categoryList;
    }
}
