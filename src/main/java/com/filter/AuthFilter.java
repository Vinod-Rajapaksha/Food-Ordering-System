package com.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
        String loginURI = httpRequest.getContextPath() + "/login";

        boolean isLoginRequest = httpRequest.getRequestURI().equals(loginURI);
        boolean isLoginPage = httpRequest.getRequestURI().endsWith("admin_login.jsp");

        if (isLoggedIn && (isLoginRequest || isLoginPage)) {
            // User is already logged in and trying to access login page
            httpResponse.sendRedirect("menu");
        } else if (isLoggedIn || isLoginRequest || isLoginPage) {
            // User is logged in or trying to access login page
            chain.doFilter(request, response);
        } else {
            // User is not logged in and trying to access protected page
            httpResponse.sendRedirect(loginURI);
        }
    }

    @Override
    public void destroy() {
        // Cleanup code if needed
    }
}
