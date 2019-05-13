package com.epam.app.controller;

import org.junit.Test;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static org.mockito.Mockito.*;
import static org.mockito.internal.verification.VerificationModeFactory.times;

public class RegisterUserControllerTest {

    private static String path = "/registration.jsp";

    @Test
    public void doGet() throws ServletException, IOException {
        final RegisterUserController controller = new RegisterUserController();
        final HttpServletRequest request = mock(HttpServletRequest.class);
        final HttpServletResponse response = mock(HttpServletResponse.class);
        final RequestDispatcher dispatcher = mock(RequestDispatcher.class);
        when(request.getRequestDispatcher(path)).thenReturn(dispatcher);
        controller.doGet(request, response);
        verify(request, times(1)).getRequestDispatcher(path);
        verify(dispatcher).forward(request, response);
    }

    @Test
    public void doPost() {

    }
}