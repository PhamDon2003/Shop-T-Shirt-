package controller;

import dal.OrderDBcontext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;
import model.Order;

public class MannagerOrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        OrderDBcontext odb = new OrderDBcontext();
        List<Order> orders = odb.getAllOrder();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("ManagerOrder.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Kiểm tra xem người dùng đã đăng nhập và có quyền quản trị viên không
        Account account = (Account) request.getSession().getAttribute("acc");
        if (account == null || account.getIsAdmin() != 1) {
            // Nếu không, chuyển hướng về trang chính
            response.sendRedirect(request.getContextPath() + "/home");
        } else {
            // Nếu có, tiếp tục xử lý như bình thường
            processRequest(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("delete")) {
            // Lấy ID của đơn hàng cần xóa từ request
            int orderId = Integer.parseInt(request.getParameter("orderId"));

            // Tạo một đối tượng OrderDBcontext để thao tác với cơ sở dữ liệu
            OrderDBcontext orderDB = new OrderDBcontext();

            // Gọi phương thức xóa đơn hàng từ cơ sở dữ liệu
            orderDB.deleteOrder(orderId);
        }
        // Sau khi xóa, chuyển hướng người dùng trở lại trang quản lý đơn hàng
        response.sendRedirect("ManagerOrderController");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
