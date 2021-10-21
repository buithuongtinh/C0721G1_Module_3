package model.service.customer.impl;

import model.bean.customer.Customer;
import model.repository.customer.ICustomerRepository;
import model.repository.customer.impl.CustomerRepositoryImpl;
import model.service.common.Validate;
import model.service.customer.ICustomerService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements ICustomerService {


    ICustomerRepository iCustomerRepository = new CustomerRepositoryImpl();

    @Override
    public Map<String, String> addNewCustomer(Customer customer) throws SQLException {
        Map<String, String> mapMessage = new HashMap<>();

        if (Validate.customerCode(customer.getCustomerCode()) != null
                || Validate.validateEmail(customer.getCustomerEmail()) != null) {
            mapMessage.put("code", Validate.customerCode(customer.getCustomerCode()));
            mapMessage.put("email", Validate.validateEmail(customer.getCustomerEmail()));
        } else {
            this.iCustomerRepository.addNewCustomer(customer);
        }
        return mapMessage;
    }

    @Override
    public Customer selectCustomer(int id) {
        return this.iCustomerRepository.selectCustomer(id);
    }

    @Override
    public List<Customer> selectAllCustomer() {
        return this.iCustomerRepository.selectAllCustomer();
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        return this.iCustomerRepository.deleteCustomer(id);
    }

    @Override
    public Map<String, String> updateCustomer(Customer customer) throws SQLException {
        Map<String, String> mapMessage = new HashMap<>();

        if (Validate.customerCode(customer.getCustomerCode()) != null
                || Validate.validateEmail(customer.getCustomerEmail()) != null) {
            mapMessage.put("code", Validate.customerCode(customer.getCustomerCode()));
            mapMessage.put("email", Validate.validateEmail(customer.getCustomerEmail()));
        } else {
            this.iCustomerRepository.updateCustomer(customer);
        }
        return mapMessage;
    }

    @Override
    public List<Customer> searchByName(String name, String address) throws SQLException {
        return this.iCustomerRepository.searchByName(name, address);
    }
}
