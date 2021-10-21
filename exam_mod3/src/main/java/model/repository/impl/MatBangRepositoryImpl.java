package model.repository.impl;

import model.bean.Matbang;
import model.repository.DBConnection;
import model.repository.IMatBangRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MatBangRepositoryImpl implements IMatBangRepository {

    private static final String SELECT_ALL_MAT_BANG = "SELECT * FROM mat_bang \n" +
            "  JOIN loai_mat_bang ON mat_bang.id_loai_mat_bang = loai_mat_bang.id_loai_mat_bang;";
    private static final String INSERT_NEW_MAT_BANG ="INSERT INTO mat_bang (id_mat_bang, dien_tich, trang_thai, tang, mo_ta_chi_tiet, gia_cho_thue, ngay_bat_dau, ngay_ket_thuc, id_loai_mat_bang) VALUES (?, ?, ?, ?, ?,?, ?, ?, ?);";

    private static final String DELETE_MAT_BANG = "DELETE FROM mat_bang WHERE id_mat_bang = ?;";

    private static final String SEARCH_MAT_BANG_BY_LOAI_MAT_BANG = "SELECT * FROM mat_bang " +
            "JOIN loai_mat_bang ON mat_bang.id_loai_mat_bang = loai_mat_bang.id_loai_mat_bang WHERE loai_mat_bang LIKE ?;";
    private static final String SEARCH_MAT_BANG_BY_TANG = "SELECT * FROM mat_bang " +
            "JOIN loai_mat_bang ON mat_bang.id_loai_mat_bang  = loai_mat_bang.id_loai_mat_bang WHERE mat_bang.tang = ?;";


    @Override
    public List<Matbang> getAllMatbang() {

        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Matbang> matbangList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_ALL_MAT_BANG);
                resultSet = preparedStatement.executeQuery();
                Matbang matbang = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("id_mat_bang");
                    double dienTich = resultSet.getInt("dien_tich");
                    boolean trangThai = Boolean.parseBoolean(resultSet.getString("trang_thai"));
                    int tang = resultSet.getInt("tang");
                    String moTa = resultSet.getString("mo_ta_chi_tiet");
                    double gia = resultSet.getDouble("gia_cho_thue");
                    String ngayBD = resultSet.getString("ngay_bat_dau");
                    String ngayKT = resultSet.getString("ngay_ket_thuc");
                    int idLoaiMatBang = resultSet.getInt("id_loai_mat_bang");
                    String tenLMB = resultSet.getString("ten_loai_mat_bang");
                    matbang = new Matbang(id,tang, trangThai,dienTich, gia,  moTa,  ngayBD, ngayKT,idLoaiMatBang,tenLMB);
                    matbangList.add(matbang);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return matbangList;
    }

    @Override
    public Matbang selectById(int id) {
        return null;
    }

    @Override
    public void create(Matbang matbang) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(INSERT_NEW_MAT_BANG);
                preparedStatement.setDouble(1, matbang.getDienTich());
                preparedStatement.setBoolean(2, matbang.isTrangThai());
                preparedStatement.setDouble(3, matbang.getTang());
                preparedStatement.setString(4, matbang.getMoTa());
                preparedStatement.setDouble(5, matbang.getGiaChoThue());
                preparedStatement.setString(6, matbang.getNgayBatDau());
                preparedStatement.setString(7, matbang.getNgayKetthuc());
                preparedStatement.setInt(8, matbang.getIdMatBang());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }

    }

    @Override
    public void delete(int id) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(DELETE_MAT_BANG);
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }


    }

    @Override
    public List<Matbang> searchByLoaiMatbang(String search) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Matbang> matbangList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SEARCH_MAT_BANG_BY_LOAI_MAT_BANG);
                String searchSQL = search.concat("%");
                preparedStatement.setString(1, searchSQL);
                resultSet = preparedStatement.executeQuery();
                Matbang matbang = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("id_mat_bang");
                    double dienTich = resultSet.getInt("dien_tich");
                    boolean trangThai = Boolean.parseBoolean(resultSet.getString("trang_thai"));
                    int tang = resultSet.getInt("tang");
                    String moTa = resultSet.getString("mo_ta_chi_tiet");
                    double gia = resultSet.getDouble("gia_cho_thue");
                    String ngayBD = resultSet.getString("ngay_bat_dau");
                    String ngayKT = resultSet.getString("ngay_ket_thuc");
                    int idLoaiMatBang = resultSet.getInt("id_loai_mat_bang");
                    String tenLMB = resultSet.getString("ten_loai_mat_bang");
                    matbang = new Matbang(id,tang, trangThai,dienTich, gia,  moTa,  ngayBD, ngayKT,idLoaiMatBang,tenLMB);
                    matbangList.add(matbang);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return matbangList;
    }

    @Override
    public List<Matbang> searchByTang(int tang) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Matbang> matbangList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SEARCH_MAT_BANG_BY_TANG);
                preparedStatement.setInt(1, tang);
                resultSet = preparedStatement.executeQuery();
                Matbang matbang = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("id_mat_bang");
                    double dienTich = resultSet.getInt("dien_tich");
                    boolean trangThai = Boolean.parseBoolean(resultSet.getString("trang_thai"));
                    String moTa = resultSet.getString("mo_ta_chi_tiet");
                    double gia = resultSet.getDouble("gia_cho_thue");
                    String ngayBD = resultSet.getString("ngay_bat_dau");
                    String ngayKT = resultSet.getString("ngay_ket_thuc");
                    int idLoaiMatBang = resultSet.getInt("id_loai_mat_bang");
                    String tenLMB = resultSet.getString("ten_loai_mat_bang");
                    matbang = new Matbang(id, trangThai,dienTich, gia,  moTa,  ngayBD, ngayKT,idLoaiMatBang,tenLMB);
                    matbangList.add(matbang);

                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return matbangList;
    }

    @Override
    public List<Matbang> searchByGia(double giaChoThue) {
        return null;
    }
}
