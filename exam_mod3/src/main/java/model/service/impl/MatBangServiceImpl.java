package model.service.impl;

import model.bean.Matbang;
import model.repository.IMatBangRepository;
import model.repository.impl.MatBangRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class MatBangServiceImpl implements IMatBangRepository {
    private IMatBangRepository matBangRepository = new MatBangRepositoryImpl();
    @Override
    public List<Matbang> getAllMatbang() {
        return this.matBangRepository.getAllMatbang();
    }

    @Override
    public Matbang selectById(int id) {
        return this.matBangRepository.selectById(id);
    }

    @Override
    public void create(Matbang matbang) throws SQLException {
        this.matBangRepository.create(matbang);

    }

    @Override
    public void delete(int id) throws SQLException {
        matBangRepository.delete(id);
    }

    @Override
    public List<Matbang> searchByLoaiMatbang(String search) {
        return this.matBangRepository.searchByLoaiMatbang(search);
    }

    @Override
    public List<Matbang> searchByTang(int tang) {
        return matBangRepository.searchByTang(tang);
    }

    @Override
    public List<Matbang> searchByGia(double giaChoThue) {
        return null;
    }
}
