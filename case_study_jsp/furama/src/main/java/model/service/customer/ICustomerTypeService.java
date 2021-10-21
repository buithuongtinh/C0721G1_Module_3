package model.service.customer;

import model.bean.customer.CustomerType;

import java.util.List;

public interface ICustomerTypeService {
    List<CustomerType> selectAllType();
}
