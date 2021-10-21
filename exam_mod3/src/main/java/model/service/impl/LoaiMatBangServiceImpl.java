package model.service.impl;

import model.bean.LoaiMatBang;
import model.repository.ILoaiMatBangRepository;

import java.util.List;

public class LoaiMatBangServiceImpl implements ILoaiMatBangRepository {
    private ILoaiMatBangRepository loaiMatBangRepository = new LoaiMatBangServiceImpl();
    @Override
    public List<LoaiMatBang> getAll() {
        return this.loaiMatBangRepository.getAll();
    }
}
