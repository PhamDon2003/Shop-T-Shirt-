package controller;

import dal.ProductDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Product;

@WebServlet(name = "EditProductController", urlPatterns = {"/edit"})
public class EditProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Product product = new Product();
        
        // Lấy thông tin sản phẩm từ request
        product.setId(Integer.parseInt(request.getParameter("id")));
        product.setName(request.getParameter("name"));
        product.setImageUrl(request.getParameter("image"));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setTiltle(request.getParameter("title"));
        product.setDescription(request.getParameter("description"));
        product.setCategoryId(Integer.parseInt(request.getParameter("category")));
        
        // Lấy thông tin tài khoản đang đăng nhập từ session
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        int sellId = account.getUid();
        product.setSell_ID(sellId);
        
        // Cập nhật thông tin sản phẩm vào cơ sở dữ liệu
        ProductDBContext productDBContext = new ProductDBContext();
        productDBContext.updateProduct(product);
        
        // Chuyển hướng về trang quản lý sản phẩm
        response.sendRedirect("manager");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
