package model.repository;

import model.bean.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> selectAllUsers();

    boolean deleteUser(int id) throws SQLException;

    boolean updateUser(User user) throws SQLException;

    List<User> search(String country);

    List<User> listAsc();

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;

}
