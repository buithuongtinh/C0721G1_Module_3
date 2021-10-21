package model.service.customer;

import model.bean.customer.Customer;


import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICustomerService {

 Map<String, String> addNewCustomer(Customer customer) throws SQLException;

 Customer selectCustomer(int id);

 List<Customer> selectAllCustomer();

 boolean deleteCustomer(int id) throws SQLException;

 Map<String, String> updateCustomer(Customer customer) throws SQLException;

 List<Customer> searchByName(String name, String address) throws SQLException;
}
