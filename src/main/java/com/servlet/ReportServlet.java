// src/main/java/com/servlet/ReportServlet.java
package com.servlet;

import java.io.IOException;

// IMPORTANT: Using javax.servlet for Tomcat 9.x compatibility
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReportServlet
 * This servlet acts as the entry point for the reporting functionality.
 * It primarily forwards the request to reports.jsp, which displays a menu
 * of available report types.
 * Compatible with Tomcat 9.x (using javax.servlet imports).
 */
@WebServlet("/ReportServlet") // Maps this servlet to the URL pattern /ReportServlet
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ReportServlet() {
        super();
    }

    /**
     * Handles HTTP GET requests. When a user navigates to /ReportServlet,
     * this method is called, and it forwards the request to reports.jsp.
     *
     * @param request The HttpServletRequest object.
     * @param response The HttpServletResponse object.
     * @throws ServletException if a servlet-specific error occurs.
     * @throws IOException if an I/O error occurs.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Simply forward to the reports.jsp page to display the report menu
        request.getRequestDispatcher("reports.jsp").forward(request, response);
    }

    /**
     * Handles HTTP POST requests. For this servlet, POST requests are
     * not typically expected, so it delegates to the doGet method.
     *
     * @param request The HttpServletRequest object.
     * @param response The HttpServletResponse object.
     * @throws ServletException if a servlet-specific error occurs.
     * @throws IOException if an I/O error occurs.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Delegate POST requests to doGet
    }
}
