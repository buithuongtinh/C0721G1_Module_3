import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "")
public class CustomerServlet extends HttpServlet {

    private static List<Customer> customerList;
    static {
        customerList = new ArrayList<>();
        customerList.add(new Customer("Bui Van A","1999-09-09","QB","avatar.jpg"));
        customerList.add(new Customer("Bui Van B","1998-09-09","DN","avatar_2.jpg"));
        customerList.add(new Customer("Bui Van C","1997-09-09","HN","avatar_3.jpg"));
        customerList.add(new Customer("Bui Van D","1996-09-09","LC","avatar_4.jpg"));
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("index.jsp").forward(request,response);

    }
}
