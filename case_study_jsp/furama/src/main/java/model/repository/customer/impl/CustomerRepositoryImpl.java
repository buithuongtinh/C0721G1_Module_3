package model.repository.customer.impl;

import model.bean.customer.Customer;
import model.repository.customer.ICustomerRepository;
import model.repository.dbConnection.BaseRepository;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements ICustomerRepository {

    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customer" + "  (customer_code, customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address) VALUES " +
            " (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_CUSTOMER_BY_ID = "select * from customer where customer_id =?";
    private static final String SELECT_ALL_CUSTOMER = "select * from customer";
    private static final String DELETE_CUSTOMER_SQL = "delete from customer where customer_id = ?";
    private static final String UPDATE_CUSTOMER_SQL = "update customer set customer_code = ?, customer_type_id = ?,customer_name = ?, customer_birthday = ?, customer_gender = ?, customer_id_card = ?, customer_phone = ?, customer_email = ?, customer_address = ? where customer_id = ?;";
    private static final String SELECT_CUSTOMER_BY_NAME = "select * from customer where customer_name like concat('%', ? , '%') and customer_address = ?;";
    private static final String SELECT_CUSTOMER_BY_NAME2 = "select * from customer where customer_name like concat('%', ? , '%');";
    private static final String SELECT_CUSTOMER_BY_NAME3 = "select * from customer where customer_address = ?;";

    BaseRepository baseRepository = new BaseRepository();

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }


    @Override
    public void addNewCustomer(Customer customer) throws SQLException {

        System.out.println(INSERT_CUSTOMER_SQL);
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(INSERT_CUSTOMER_SQL);
            preparedStatement.setString(1, customer.getCustomerCode());
            preparedStatement.setInt(2, customer.getCustomerTypeId());
            preparedStatement.setString(3, customer.getCustomerName());
            preparedStatement.setString(4, customer.getCustomerBirthday());
            preparedStatement.setInt(5, customer.getCustomerGender());
            preparedStatement.setString(6, customer.getCustomerIdCard());
            preparedStatement.setString(7, customer.getCustomerPhone());
            preparedStatement.setString(8, customer.getCustomerEmail());
            preparedStatement.setString(9, customer.getCustomerAddress());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public Customer selectCustomer(int id) {
        Customer customer = null;
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String code = resultSet.getString("customer_code");
                int typeId = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("customer_name");
                String dob = resultSet.getString("customer_birthday");
                int gender = resultSet.getInt("customer_gender");
                String card = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                customer = new Customer(id, typeId,code,  name, dob, gender, card, phone, email, address);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customer;
    }

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL_CUSTOMER);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("customer_id");
                String code = resultSet.getString("customer_code");
                int typeId = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("customer_name");
                String dob = resultSet.getString("customer_birthday");
                int gender = resultSet.getInt("customer_gender");
                String card = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                customerList.add(new Customer(id,typeId,  code, name, dob, gender, card, phone, email, address));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        boolean rowDeleted = false;
        try {
            PreparedStatement statement = baseRepository.getConnection().prepareStatement(DELETE_CUSTOMER_SQL);
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        Connection connection =BaseRepository.getConnection();
        PreparedStatement preparedStatement =null;
        boolean rowUpdated ;
        if(connection != null){
           try {
               preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_SQL);
               preparedStatement.setString(1, customer.getCustomerCode());
               preparedStatement.setInt(2, customer.getCustomerTypeId());
               preparedStatement.setString(3, customer.getCustomerName());
               preparedStatement.setString(4, customer.getCustomerBirthday());
               preparedStatement.setInt(5, customer.getCustomerGender());
               preparedStatement.setString(6, customer.getCustomerIdCard());
               preparedStatement.setString(7, customer.getCustomerPhone());
               preparedStatement.setString(8, customer.getCustomerEmail());
               preparedStatement.setString(9, customer.getCustomerAddress());
               preparedStatement.setInt(10, customer.getCustomerId());
               rowUpdated = preparedStatement.executeUpdate() > 0;

                 return rowUpdated;
                } catch (SQLException throwables) {
                  throwables.printStackTrace();
                 }finally {
                try {
                    preparedStatement.close();
                }catch (SQLException e){
                    e.printStackTrace();
                }
                BaseRepository.close();
           }
        }
        return false;
    }

    @Override
    public List<Customer> searchByName(String name, String address) throws SQLException {
        List<Customer> customers = new ArrayList<>();
        PreparedStatement preparedStatement;
        if (name.equals("")) {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_CUSTOMER_BY_NAME3);
            preparedStatement.setString(1, address);
        } else if (address.equals("")) {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_CUSTOMER_BY_NAME2);
            preparedStatement.setString(1, name);
        } else {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_CUSTOMER_BY_NAME);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, address);
        }
        System.out.println(preparedStatement);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("customer_id");
            String code = resultSet.getString("customer_code");
            int typeId = resultSet.getInt("customer_type_id");
            String nameSearch = resultSet.getString("customer_name");
            String dob = resultSet.getString("customer_birthday");
            int gender = resultSet.getInt("customer_gender");
            String card = resultSet.getString("customer_id_card");
            String phone = resultSet.getString("customer_phone");
            String email = resultSet.getString("customer_email");
            String addresss = resultSet.getString("customer_address");
            customers.add(new Customer(id, typeId,code,  nameSearch, dob, gender, card, phone, email, addresss));
        }
        return customers;
    }

}