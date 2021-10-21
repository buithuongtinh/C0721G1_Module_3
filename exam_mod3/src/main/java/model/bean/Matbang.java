package model.bean;

public class Matbang {
    private int idMatBang;
    private int tang;
    private boolean trangThai;
    private double dienTich;
    private double giaChoThue;
    private String moTa ;
    private String ngayBatDau;
    private String NgayKetthuc;
    private int idLoaiMatBang;
    private String tenLoaiMatBang;

    public Matbang() {
    }

    public Matbang(int tang, boolean trangThai, double dienTich, double giaChoThue, String moTa, String ngayBatDau,
                   String ngayKetthuc, int idLoaiMatBang, String tenLoaiMatBang) {
        this.tang = tang;
        this.trangThai = trangThai;
        this.dienTich = dienTich;
        this.giaChoThue = giaChoThue;
        this.moTa = moTa;
        this.ngayBatDau = ngayBatDau;
        NgayKetthuc = ngayKetthuc;
        this.idLoaiMatBang = idLoaiMatBang;
        this.tenLoaiMatBang = tenLoaiMatBang;
    }

    public Matbang(int idMatBang, int tang, boolean trangThai, double dienTich, double giaChoThue, String moTa,
                   String ngayBatDau, String ngayKetthuc, int idLoaiMatBang, String tenLoaiMatBang) {
        this.idMatBang = idMatBang;
        this.tang = tang;
        this.trangThai = trangThai;
        this.dienTich = dienTich;
        this.giaChoThue = giaChoThue;
        this.moTa = moTa;
        this.ngayBatDau = ngayBatDau;
        NgayKetthuc = ngayKetthuc;
        this.idLoaiMatBang = idLoaiMatBang;
        this.tenLoaiMatBang = tenLoaiMatBang;
    }

    public int getIdMatBang() {
        return idMatBang;
    }

    public void setIdMatBang(int idMatBang) {
        this.idMatBang = idMatBang;
    }

    public int getTang() {
        return tang;
    }

    public void setTang(int tang) {
        this.tang = tang;
    }

    public boolean isTrangThai() {
        return trangThai;
    }

    public void setTrangThai(boolean trangThai) {
        this.trangThai = trangThai;
    }

    public double getDienTich() {
        return dienTich;
    }

    public void setDienTich(double dienTich) {
        this.dienTich = dienTich;
    }

    public double getGiaChoThue() {
        return giaChoThue;
    }

    public void setGiaChoThue(double giaChoThue) {
        this.giaChoThue = giaChoThue;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getNgayBatDau() {
        return ngayBatDau;
    }

    public void setNgayBatDau(String ngayBatDau) {
        this.ngayBatDau = ngayBatDau;
    }

    public String getNgayKetthuc() {
        return NgayKetthuc;
    }

    public void setNgayKetthuc(String ngayKetthuc) {
        NgayKetthuc = ngayKetthuc;
    }

    public int getIdLoaiMatBang() {
        return idLoaiMatBang;
    }

    public void setIdLoaiMatBang(int idLoaiMatBang) {
        this.idLoaiMatBang = idLoaiMatBang;
    }

    public String getTenLoaiMatBang() {
        return tenLoaiMatBang;
    }

    public void setTenLoaiMatBang(String tenLoaiMatBang) {
        this.tenLoaiMatBang = tenLoaiMatBang;
    }
}
