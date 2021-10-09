import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet",urlPatterns = "")
public class ProductServlet extends HttpServlet {

    private static List<Product> productList;
    static {
        productList = new ArrayList<>();
        productList.add(new Product("Bui Van A","1999-09-09","QB","avatar.jpg"));
        productList.add(new Product("Bui Van B","1998-09-09","DN","avatar_2.jpg"));
        productList.add(new Product("Bui Van C","1997-09-09","HN","avatar_3.jpg"));
        productList.add(new Product("Bui Van D","1996-09-09","LC","avatar_4.jpg"));
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("productList",productList);
        request.getRequestDispatcher("index.jsp").forward(request,response);

    }
}
