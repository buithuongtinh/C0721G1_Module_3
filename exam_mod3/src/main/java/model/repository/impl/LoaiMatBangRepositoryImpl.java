package model.repository.impl;

import model.bean.LoaiMatBang;
import model.repository.DBConnection;
import model.repository.ILoaiMatBangRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoaiMatBangRepositoryImpl implements ILoaiMatBangRepository {

        private static final String SELECT_ALL_LOAI_MAT_BANG = "SELECT * FROM loai_mat_bang;";
    @Override
    public List<LoaiMatBang> getAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<LoaiMatBang> loaiMatBangList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_ALL_LOAI_MAT_BANG);
                resultSet = preparedStatement.executeQuery();
                LoaiMatBang loaiMatBang = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("id_loai_mat_bang");
                    String name = resultSet.getString("ten_mat_bang");
                    loaiMatBang = new LoaiMatBang(id, name);
                    loaiMatBangList.add(loaiMatBang);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }

        }
        return loaiMatBangList;
    }
}
