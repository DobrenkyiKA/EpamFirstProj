package com.epam.app.controller;

import com.epam.app.model.Book;
import com.epam.app.service.BookService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class BookListController extends HttpServlet {
    private static final int BUTTONS_TO_SHOW = 3;
    public static final int INITIAL_PAGE = 0;
    public static final int INITIAL_PAGE_SIZE = 10;
    public static final int[] PAGE_SIZES = {10};

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Book> allBooks = null;
        try {
            allBooks = BookService.getAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.getSession().setAttribute("list", allBooks);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/BookListView.jsp");
        requestDispatcher.forward(req, resp);
    }

}