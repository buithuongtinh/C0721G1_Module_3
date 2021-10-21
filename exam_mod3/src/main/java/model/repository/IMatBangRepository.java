package model.repository;

import model.bean.Matbang;

import java.sql.SQLException;
import java.util.List;

public interface IMatBangRepository {
    List<Matbang> getAllMatbang ();
    Matbang selectById (int id);
    void create(Matbang matbang) throws SQLException;
    void delete(int id) throws SQLException;
    List<Matbang> searchByLoaiMatbang (String search);
    List<Matbang> searchByTang (int tang);
    List<Matbang> searchByGia (double giaChoThue);


}
