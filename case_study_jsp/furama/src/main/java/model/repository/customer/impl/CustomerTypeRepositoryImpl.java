package model.repository.customer.impl;

import model.bean.customer.CustomerType;


import model.repository.customer.ICustomerTypeRepository;
import model.repository.dbConnection.BaseRepository;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepositoryImpl implements ICustomerTypeRepository {
    private final String SELECT_ALL_TYPE = "Select * from customer_type";

    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<CustomerType> selectAllType() {
        List<CustomerType> customerTypes = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL_TYPE);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("customer_type_name");
                customerTypes.add(new CustomerType(id, name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerTypes;
    }

}
