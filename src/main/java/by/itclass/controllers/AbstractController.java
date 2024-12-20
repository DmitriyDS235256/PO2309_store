package by.itclass.controllers;


import by.itclass.model.services.CartService;
import by.itclass.model.services.LaptopService;
import by.itclass.model.services.TvService;
import by.itclass.model.services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static by.itclass.constants.AppConst.MESSAGE_ATTR;

public abstract class AbstractController extends HttpServlet {
    protected UserService userService;
    protected TvService tvService;
    protected LaptopService laptopService;
    protected CartService cartService;
    private HttpServletRequest req;

    @Override
    public void init() throws ServletException {
        userService = UserService.getInstance();
        tvService = TvService.getInstance();
        laptopService = LaptopService.getInstance();
        cartService = CartService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException{
        req.getRequestDispatcher(url).forward(req, resp);
    }

    protected void forward(HttpServletRequest req, HttpServletResponse resp,String url, String message) throws ServletException, IOException{
        req.setAttribute(MESSAGE_ATTR, message);
        req.getRequestDispatcher(url).forward(req, resp);
    }

    protected void redirect(HttpServletResponse resp, String url)throws IOException{
        resp.sendRedirect(url);
    }

}
