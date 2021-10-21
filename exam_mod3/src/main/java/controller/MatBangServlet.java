package controller;

import model.bean.LoaiMatBang;
import model.bean.Matbang;
import model.service.impl.LoaiMatBangServiceImpl;
import model.service.impl.MatBangServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Servlet" ,urlPatterns = "/matbang")
public class MatBangServlet extends HttpServlet {
        MatBangServiceImpl matBangService = new MatBangServiceImpl();
        LoaiMatBangServiceImpl loaiMatBangService = new LoaiMatBangServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    createNewMatBang(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "search":
                searchMatBang(request, response);
                break;
            case "delete":
                try {
                    deleteMatBang(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
        }
    }

    private void deleteMatBang(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idMatBang"));
        matBangService.delete(id);
        listMatBang(request, response);


    }

    private void searchMatBang(HttpServletRequest request, HttpServletResponse response) {

    }

    private void createNewMatBang(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        double dienTich = Double.parseDouble(request.getParameter("dienTich"));
        boolean trangThai = Boolean.parseBoolean(request.getParameter("trangThai"));
        int tang = Integer.parseInt(request.getParameter("tang"));
        String moTa = request.getParameter("moTa");
        double giaChoThue = Double.parseDouble(request.getParameter("giaChoThue"));
        String ngayBD = request.getParameter("ngayBatDau");
        String ngayKT = request.getParameter("NgayKetthuc");
        int loatMB = Integer.parseInt(request.getParameter("idLoaiMatBang"));
        String tenLoaiMatBang = request.getParameter("tenLoaiMatBang");
        Matbang matbang = new Matbang(tang,trangThai,dienTich,giaChoThue,moTa,ngayBD,ngayKT,loatMB,tenLoaiMatBang);

        this.matBangService.create(matbang);
        request.setAttribute("msg","Thêm mới thành công");
        listMatBang(request, response);
        request.getRequestDispatcher("matBang/create.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "search":
                showSearchForm(request, response);
                break;
            default:
                listMatBang(request, response);
                break;
        }
    }

    private void listMatBang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Matbang> matbangList = matBangService.getAllMatbang();
        request.setAttribute("matbangList", matbangList);
        request.getRequestDispatcher("matBang/list.jsp").forward(request, response);

    }

    private void showSearchForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        List<Matbang> categoryList = matBangService.getAllMatbang();
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("search", search);
        request.getRequestDispatcher("/matBang/search.jsp").forward(request, response);



    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<LoaiMatBang> loaiMatBangList = loaiMatBangService.getAll();
        request.setAttribute("loaiMatBangList", loaiMatBangList);
        request.getRequestDispatcher("/matBang/create.jsp").forward(request, response);

    }
}
