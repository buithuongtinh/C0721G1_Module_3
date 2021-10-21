package controller;

import model.bean.Category;
import model.bean.Product;

import model.service.Validator;
import model.service.impl.CategoryServiceImpl;
import model.service.impl.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    ProductServiceImpl productService = new ProductServiceImpl();
    CategoryServiceImpl categoryService = new CategoryServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    createNewProduct(request, response);
                    break;
                case "edit":
                    editProduct(request, response);
                    break;
                case "search":
                    searchProduct(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showCreateForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "search":
                    showSearchForm(request, response);
                    break;
                default:
                    listProduct(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Product> productList = productService.getAllProduct();
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("product/list.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Category> categoryList = categoryService.getAllCategory();
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("/product/create.jsp").forward(request, response);
    }

    private void createNewProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        double price = 0;
        boolean checkPrice = true;
        if (Validator.validateNumber(request.getParameter("price")) != null) {
            checkPrice = false;
        } else {
            price = Double.parseDouble(request.getParameter("price"));
        }
        int quantity = 0;
        boolean checkQuantity = true;
        if (Validator.validateNumber(request.getParameter("quantity")) != null) {
            checkQuantity = false;
        } else {
            quantity = Integer.parseInt(request.getParameter("quantity"));
        }
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        Product product = new Product(name, price, quantity, color, description, categoryId);
        Map<String, String> mapMessage = productService.creatNewProduct(product);
        if (!mapMessage.isEmpty() || !checkPrice || !checkQuantity) {
            request.setAttribute("mapMessage", mapMessage);
            request.setAttribute("name", name);
            request.setAttribute("price", price);
            request.setAttribute("quantity", quantity);
            request.setAttribute("color", color);
            request.setAttribute("description", description);
            request.setAttribute("categoryId", categoryId);
            showCreateForm(request, response);
        } else {
            request.setAttribute("message", "Create successful");
            request.getRequestDispatcher("/product/create.jsp").forward(request, response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.selectProductById(id);
        List<Category> categoryList = categoryService.getAllCategory();
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("product", product);
        request.getRequestDispatcher("/product/edit.jsp").forward(request, response);
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = 0;
        boolean checkPrice = true;
        if (Validator.validateNumber(request.getParameter("price")) != null) {
            checkPrice = false;
        } else {
            price = Double.parseDouble(request.getParameter("price"));
        }
        int quantity = 0;
        boolean checkQuantity = true;
        if (Validator.validateNumber(request.getParameter("quantity")) != null) {
            checkQuantity = false;
        } else {
            quantity = Integer.parseInt(request.getParameter("quantity"));
        }
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        Product product = new Product(id, name, price, quantity, color, description, categoryId);
        Map<String, String> mapMessage = productService.editProduct(product);
        if (!mapMessage.isEmpty() || !checkPrice || !checkQuantity) {
            request.setAttribute("mapMessage", mapMessage);
            showEditForm (request, response);
        } else {
            request.setAttribute("message", "Edit successful");
            request.getRequestDispatcher("/product/edit.jsp").forward(request, response);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("idProduct"));
        productService.deleteProduct(id);
        listProduct(request, response);
    }

    private void showSearchForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String search = request.getParameter("search");
        List<Category> categoryList = categoryService.getAllCategory();
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("search", search);
        request.getRequestDispatcher("/product/search.jsp").forward(request, response);
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String search = request.getParameter("search");
        List<Product> productList = new ArrayList<>();
        RequestDispatcher dispatcher;
        switch (search) {
            case "name":
                String searchName = request.getParameter("name");
                productList = productService.searchProductByName(searchName);
                if (productList.isEmpty()) {
                    request.setAttribute("productList", productList);
                    request.setAttribute("message", "Not found");
                    dispatcher = request.getRequestDispatcher("/product/search.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("productList", productList);
                    request.setAttribute("message", "Search successful");
                    dispatcher = request.getRequestDispatcher("/product/search.jsp");
                    dispatcher.forward(request, response);
                }
                break;
            case "category":
                int searchCategoryId = Integer.parseInt(request.getParameter("categoryId"));
                productList = productService.searchProductByCategory(searchCategoryId);
                if (productList.isEmpty()) {
                    request.setAttribute("productList", productList);
                    request.setAttribute("message", "Not found");
                    dispatcher = request.getRequestDispatcher("/product/search.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("productList", productList);
                    request.setAttribute("message", "Search successful");
                    dispatcher = request.getRequestDispatcher("/product/search.jsp");
                    dispatcher.forward(request, response);
                }
                break;
        }
    }
}