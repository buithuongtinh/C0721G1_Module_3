package model.service.customer.impl;

import model.bean.customer.CustomerType;
import model.repository.customer.ICustomerTypeRepository;
import model.repository.customer.impl.CustomerTypeRepositoryImpl;
import model.service.customer.ICustomerTypeService;

import java.util.List;

public class CustomerTypeServiceImpl implements ICustomerTypeService {
    ICustomerTypeRepository iCustomerTypeRepository = new CustomerTypeRepositoryImpl();
    @Override
    public List<CustomerType> selectAllType() {
        return this.iCustomerTypeRepository.selectAllType();
    }
}
