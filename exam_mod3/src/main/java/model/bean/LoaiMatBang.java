package model.bean;

public class LoaiMatBang {
    private int idLoaiMatBang;
    private String tenLoaiMatBang;

    public LoaiMatBang() {
    }

    public LoaiMatBang(int idLoaiMatBang, String tenLoaiMatBang) {
        this.idLoaiMatBang = idLoaiMatBang;
        this.tenLoaiMatBang = tenLoaiMatBang;
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
