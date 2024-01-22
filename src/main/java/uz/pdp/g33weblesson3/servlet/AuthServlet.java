package uz.pdp.g33weblesson3.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.g33weblesson3.domain.User;
import uz.pdp.g33weblesson3.servie.UserService;

import java.io.IOException;

//@WebServlet("/auth?action=login")
public class AuthServlet extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/auth.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if ("signup".equals(req.getParameter("action"))) {
            try {
                User user = userService.save(
                        req.getParameter("email"),
                        req.getParameter("username"),
                        req.getParameter("password")
                );
                req.getSession().setAttribute("user", user);
                resp.sendRedirect("/");
            } catch (Exception e) {
                req.setAttribute("error", e.getMessage());
                req.getRequestDispatcher("auth.jsp?action=signup").forward(req,resp);
            }
        } else if ("login".equals(req.getParameter("action"))) {
            try {
                User user = userService.getByEmailAndPassword(
                        req.getParameter("email"),
                        req.getParameter("password")
                );
                req.getSession().setAttribute("user", user);
                resp.sendRedirect("/");
            } catch (Exception e) {
                req.setAttribute("error", e.getMessage());
                req.getRequestDispatcher("auth.jsp?action=login").forward(req,resp);
            }
        }
    }
}
