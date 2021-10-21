package model.repository.customer;

import model.bean.customer.CustomerType;

import java.util.List;

public interface ICustomerTypeRepository {
    List<CustomerType> selectAllType();
}
