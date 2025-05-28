// src/main/java/com/servlet/DeleteMarkServlet.java
package com.servlet;

import com.dao.MarkDAO;        // Import the MarkDAO interface
import com.dao.MarkDAOImpl;    // Import the MarkDAOImpl implementation

import java.io.IOException;

// IMPORTANT: Using javax.servlet for Tomcat 9.x compatibility
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteMarkServlet
 * This servlet handles requests to delete a student mark.
 * It supports:
 * 1. GET request: Typically used when clicking a "Delete" link from DisplayMarksServlet.
 * It will attempt to delete the record directly.
 * 2. POST request: Used when the delete form (markdelete.jsp) is submitted.
 * Compatible with Tomcat 9.x (using javax.servlet imports).
 */
@WebServlet("/deleteMark") // Maps this servlet to the URL pattern /deleteMark
public class DeleteMarkServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MarkDAO markDAO;

    public DeleteMarkServlet() {
        super();
        this.markDAO = new MarkDAOImpl();
    }

    /**
     * Handles HTTP GET requests for deleting a mark.
     * This is typically called from markdisplay.jsp's "Delete" link.
     *
     * @param request The HttpServletRequest object.
     * @param response The HttpServletResponse object.
     * @throws ServletException if a servlet-specific error occurs.
     * @throws IOException if an I/O error occurs.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentIDStr = request.getParameter("studentID");
        String message = "";
        String messageType = "";

        if (studentIDStr != null && !studentIDStr.isEmpty()) {
            try {
                int studentID = Integer.parseInt(studentIDStr);
                boolean success = markDAO.deleteMark(studentID); // Call DAO to delete

                if (success) {
                    message = "Student mark with ID " + studentID + " deleted successfully!";
                    messageType = "success";
                } else {
                    // Specific message for record not found during deletion
                    message = "Failed to delete student mark with ID " + studentID + ". Record not found.";
                    messageType = "error";
                }
            } catch (NumberFormatException e) {
                message = "Invalid Student ID format for deletion.";
                messageType = "error";
                System.err.println("Number format error in DeleteMarkServlet doGet: " + e.getMessage());
            } catch (Exception e) {
                message = "An error occurred while deleting the mark: " + e.getMessage();
                messageType = "error";
                System.err.println("Database error deleting mark in DeleteMarkServlet doGet: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            message = "Student ID is required for deletion.";
            messageType = "error";
        }

        // After deletion attempt, redirect to DisplayMarksServlet to show updated list and message
        response.sendRedirect("DisplayMarksServlet?message=" +
                              java.net.URLEncoder.encode(message, "UTF-8") +
                              "&messageType=" + messageType);
    }

    /**
     * Handles HTTP POST requests for deleting a mark.
     * This is called when the markdelete.jsp form is submitted.
     *
     * @param request The HttpServletRequest object.
     * @param response The HttpServletResponse object.
     * @throws ServletException if a servlet-specific error occurs.
     * @throws IOException if an I/O error occurs.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentIDStr = request.getParameter("studentID");
        String message = "";
        String messageType = "";

        if (studentIDStr != null && !studentIDStr.isEmpty()) {
            try {
                int studentID = Integer.parseInt(studentIDStr);
                boolean success = markDAO.deleteMark(studentID); // Call DAO to delete

                if (success) {
                    message = "Student mark with ID " + studentID + " deleted successfully!";
                    messageType = "success";
                } else {
                    // Specific message for record not found during deletion
                    message = "Failed to delete student mark with ID " + studentID + ". Record not found.";
                    messageType = "error";
                }
            } catch (NumberFormatException e) {
                message = "Invalid Student ID format for deletion.";
                messageType = "error";
                System.err.println("Number format error in DeleteMarkServlet doPost: " + e.getMessage());
            } catch (Exception e) {
                message = "An error occurred while deleting the mark: " + e.getMessage();
                messageType = "error";
                System.err.println("Database error deleting mark in DeleteMarkServlet doPost: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            message = "Student ID is required for deletion.";
            messageType = "error";
        }

        // Forward back to markdelete.jsp to display the message
        request.setAttribute("message", message);
        request.setAttribute("messageType", messageType);
        request.getRequestDispatcher("markdelete.jsp").forward(request, response);
    }
}
