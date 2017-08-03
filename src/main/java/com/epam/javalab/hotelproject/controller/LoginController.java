package com.epam.javalab.hotelproject.controller;

import com.epam.javalab.hotelproject.model.User;
import com.epam.javalab.hotelproject.repository.UserDAO;
import com.epam.javalab.hotelproject.repository.UserRepository;
import com.epam.javalab.hotelproject.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(
        name = "UserServlet",
        urlPatterns = {"/login"}
)
public class LoginController extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/jsp/login.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String pass = req.getParameter("password");
        User user = new User("", "", login, pass);
        String message = null;

        if (userService.authorize(user)) {
            HttpSession session = req.getSession();
            session.setAttribute("login", login);
            resp.sendRedirect("/administrator");
        } else {
            message = "Password or login is wrong";
            req.setAttribute("message", message);
            req.getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
        }


    }
}
