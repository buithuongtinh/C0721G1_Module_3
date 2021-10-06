import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet ",value = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Kiểm tra nếu $username và $password có giá trị là "admin" và "admin" thì hiển thị thông báo "Welcome [username] to website".
//                Còn lại hiển thị lỗi "Login Error".

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        PrintWriter writer = response.getWriter();
        writer.println("<html>");

        if ("admin".equals(username) && "admin".equals(password)) {
            writer.println("<h1>Welcome " + username+" to website</h1>");

        }else {
            writer.println("<h1>Login Error</h1>");
        }
        writer.println("</html>");

//        phương thức request.getParameter() được sử dụng để lấy tham số được đẩy lên từ form.
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
