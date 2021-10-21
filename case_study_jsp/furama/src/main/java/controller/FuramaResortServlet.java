package controller;

import model.bean.customer.Customer;
import model.bean.customer.CustomerType;
import model.service.customer.ICustomerService;
import model.service.customer.ICustomerTypeService;
import model.service.customer.impl.CustomerServiceImpl;
import model.service.customer.impl.CustomerTypeServiceImpl;

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

@WebServlet(name = " FuramaResortServlet" , urlPatterns = "/furama")
public class FuramaResortServlet extends HttpServlet {


    ICustomerService iCustomerService = new CustomerServiceImpl();
    ICustomerTypeService iCustomerTypeService = new CustomerTypeServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {

                case "create-customer":
                    createCustomer(request, response);
                    break;

                case "edit-customer":
                    updateCustomer(request, response);
                    break;

                case "search-customer":
                    searchByCustomerName(request, response);
                    break;

            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void searchByCustomerName(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String customerName = request.getParameter("customerName");
        String customerAddress = request.getParameter("customerAddress");
        System.out.println(customerName);
        List<Customer> customerList = new ArrayList<>();
        customerList.addAll(iCustomerService.searchByName(customerName, customerAddress));
        RequestDispatcher dispatcher = null;
        if (customerList.isEmpty()) {
            request.setAttribute("listCustomer", customerList);
            dispatcher = request.getRequestDispatcher("customer/search.jsp");
            request.setAttribute("msg", "Empty!");
        } else {
            request.setAttribute("listCustomer", customerList);
            dispatcher = request.getRequestDispatcher("customer/search.jsp");
            request.setAttribute("msg", customerList.size() + " record(s)");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("code");
        int type = Integer.parseInt(request.getParameter("type"));
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("card");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id,type,code,  name, dob, gender, idCard, phone, email, address);
        Map<String, String> mapMess = this.iCustomerService.addNewCustomer(customer);
        if (mapMess.isEmpty()) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit.jsp");
            request.setAttribute("msg", "sửa successfully.");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("map", mapMess);
            request.setAttribute("newCustomer", customer);
            showCreateCustomerForm(request, response);
        }

    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String code = request.getParameter("code");
        int type = Integer.parseInt(request.getParameter("type"));
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("card");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(type,code,  name, dob, gender, idCard, phone, email, address);
        Map<String, String> mapMess = this.iCustomerService.addNewCustomer(customer);
        if (mapMess.isEmpty()) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
            request.setAttribute("msg", "Created successfully.");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("map", mapMess);
            request.setAttribute("newCustomer", customer);
            showCreateCustomerForm(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {

                case "create-customer":
                    showCreateCustomerForm(request, response);
                    break;
                case "list-customer":
                    listCustomer(request, response);
                    break;
                case "edit-customer":
                    showEditCustomerForm(request, response);
                    break;
                case "delete-customer":
                    deleteCustomer(request, response);
                    break;

            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        iCustomerService.deleteCustomer(id);
        request.setAttribute("msg", "Customer id = " + id + " have been deleted!");
        listCustomer(request, response);
    }

    private void showEditCustomerForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = iCustomerService.selectCustomer(id);
        List<CustomerType> customerTypes = iCustomerTypeService.selectAllType();
        request.setAttribute("typeList", customerTypes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        request.setAttribute("customer", customer);
        dispatcher.forward(request, response);

    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Customer> customerList = iCustomerService.selectAllCustomer();
        request.setAttribute("listCustomer", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        dispatcher.forward(request, response);

    }

    private void showCreateCustomerForm(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        List<CustomerType> customerTypes = iCustomerTypeService.selectAllType();
        request.setAttribute("typeList", customerTypes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
        dispatcher.forward(request, response);
    }
}
