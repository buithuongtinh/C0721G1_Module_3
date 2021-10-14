package model.repository.impl;

import model.bean.User;
import model.repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {

    private String jdbcURL = "jdbc:mysql://localhost:3306/demo_3?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "tinh2000";
    private static final String INSERT_USERS_SQL = "INSERT INTO users" + "  (name, email, country) VALUES " +
            " (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";

    public UserRepository() {
    }

    protected Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }


    @Override
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
        ) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
        ) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDelete = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS_SQL);
        ) {
            preparedStatement.setInt(1, id);
            rowDelete = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdate = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL)
        ) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4, user.getId());
            rowUpdate = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdate;
    }


    @Override
    public List<User> search(String country) {
        List<User> userList = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement
                    ("select id,`name`,email,country\n" +
                            "from users\n" +
                            "where country = ?;");
            preparedStatement.setString(1,country);
            ResultSet resultSet = preparedStatement.executeQuery();
            User user = null;
            while (resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public List<User> listAsc() {
        List<User> userList = new ArrayList<>();
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement
                    ("select id,`name`,email,country\n" +
                            "from users\n" +
                            "order by `name`;");
            ResultSet resultSet = preparedStatement.executeQuery();
            User user = null;
            while (resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }


    public User getUserById(int id) {
        User user = null;
        try {
            CallableStatement callableStatement =getConnection().prepareCall("call get_user_by_id(?); ");
            callableStatement.setInt(1,id);
            ResultSet resultSet = callableStatement.executeQuery(); //user_name,email,country
            if (resultSet.next()) {
                user = new User();
                user.setId(id);
                user.setName(resultSet.getString("user_name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        int row = 0;
        try {
            CallableStatement callableStatement = getConnection().prepareCall("call insert_user (?,?,?);");
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2,  user.getEmail());
            callableStatement.setString(3,  user.getCountry());

            row = callableStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }





}
