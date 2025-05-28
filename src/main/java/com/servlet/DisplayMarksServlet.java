// src/main/java/com/servlet/DisplayMarksServlet.java
package com.servlet;

import com.dao.MarkDAO;
import com.dao.MarkDAOImpl;
import com.model.StudentMark;

import java.io.IOException;
import java.util.ArrayList; // Used if a single student is found
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DisplayMarksServlet
 * This servlet handles displaying all student marks or searching for a specific mark by ID.
 * It also receives messages from other servlets (e.g., Add, Update, Delete) and displays them.
 */
@WebServlet("/DisplayMarksServlet")
public class DisplayMarksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MarkDAO markDAO;

    public DisplayMarksServlet() {
        super();
        this.markDAO = new MarkDAOImpl(); // Initialize your DAO
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<StudentMark> studentMarks = null;
        String message = request.getParameter("message"); // Get message from other servlets
        String messageType = request.getParameter("messageType"); // Get message type

        String searchIDStr = request.getParameter("searchID"); // Get the search ID parameter

        try {
            if (searchIDStr != null && !searchIDStr.isEmpty()) {
                // User wants to search for a specific ID
                try {
                    int studentID = Integer.parseInt(searchIDStr);
                    StudentMark foundMark = markDAO.getMarkById(studentID); // Use DAO to get by ID
                    if (foundMark != null) {
                        studentMarks = new ArrayList<>(); // Create a list to hold the single result
                        studentMarks.add(foundMark);
                        message = "Student record for ID " + studentID + " found.";
                        messageType = "success";
                    } else {
                        studentMarks = new ArrayList<>(); // Empty list as no record found
                        message = "No student record found for ID: " + studentID + ".";
                        messageType = "info";
                    }
                } catch (NumberFormatException e) {
                    studentMarks = markDAO.getAllMarks(); // Fallback to all if ID format is invalid
                    message = "Invalid Student ID format for search.";
                    messageType = "error";
                    System.err.println("Number format error in DisplayMarksServlet search: " + e.getMessage());
                }
            } else {
                // No search ID provided, display all marks
                studentMarks = markDAO.getAllMarks();
                if (studentMarks.isEmpty()) {
                    message = (message != null && !message.isEmpty()) ? message : "No student records available.";
                    messageType = (messageType != null && !messageType.isEmpty()) ? messageType : "info";
                }
            }
        } catch (Exception e) {
            studentMarks = new ArrayList<>(); // Ensure list is not null on error
            message = "An error occurred while retrieving marks: " + e.getMessage();
            messageType = "error";
            System.err.println("Error in DisplayMarksServlet: " + e.getMessage());
            e.printStackTrace();
        }

        request.setAttribute("studentMarks", studentMarks);
        request.setAttribute("message", message);
        request.setAttribute("messageType", messageType);

        request.getRequestDispatcher("markdisplay.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Typically, display operations are handled by GET requests.
        // Delegate POST requests to doGet for consistency in this context.
        doGet(request, response);
    }
}
