// src/main/java/com/servlet/UpdateMarkServlet.java
package com.servlet;

import com.dao.MarkDAO;
import com.dao.MarkDAOImpl;
import com.model.StudentMark;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

// IMPORTANT: Using javax.servlet for Tomcat 9.x compatibility
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateMarkServlet
 * This servlet handles requests to update an existing student mark.
 * It supports:
 * 1. GET request: Fetching a student mark by ID and pre-filling the update form (markupdate.jsp).
 * 2. POST request: Processing the updated form data and saving it to the database.
 * Compatible with Tomcat 9.x (using javax.servlet imports).
 */
@WebServlet("/updateMark") // Maps this servlet to the URL pattern /updateMark
public class UpdateMarkServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MarkDAO markDAO;

    public UpdateMarkServlet() {
        super();
        this.markDAO = new MarkDAOImpl();
    }

    /**
     * Handles HTTP GET requests for updating a mark.
     * This is typically called when "Edit" link is clicked from DisplayMarksServlet.
     * It fetches the student mark by ID and forwards to markupdate.jsp.
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
        StudentMark studentMark = null;
        String message = (String) request.getAttribute("message"); 
        String messageType = (String) request.getAttribute("messageType"); 

        if (studentIDStr != null && !studentIDStr.isEmpty()) {
            try {
                int studentID = Integer.parseInt(studentIDStr);
                studentMark = markDAO.getMarkById(studentID); // Use your DAO to get the mark by ID

                if (studentMark == null) {
                    // Only set message if it wasn't already set by a previous POST (e.g., failed update)
                    if (message == null || message.isEmpty()) {
                        message = "Student with ID " + studentID + " not found.";
                        messageType = "error";
                    }
                    System.out.println("UpdateMarkServlet: StudentMark object is null after DAO call for ID " + studentID);
                } else {
                    System.out.println("UpdateMarkServlet: StudentMark object fetched successfully: " + studentMark.getStudentName() + " (ID: " + studentMark.getStudentID() + ")");
                }
            } catch (NumberFormatException e) {
                message = "Invalid Student ID format.";
                messageType = "error";
                System.err.println("Number format error for studentID in UpdateMarkServlet doGet: " + e.getMessage());
            } catch (Exception e) {
                message = "An error occurred while fetching student details: " + e.getMessage();
                messageType = "error";
                System.err.println("Database error fetching mark in UpdateMarkServlet doGet: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            message = "Student ID is required to update a mark.";
            messageType = "error";
            System.out.println("UpdateMarkServlet: studentIDStr was null or empty.");
        }

        request.setAttribute("studentMark", studentMark);
        request.setAttribute("message", message);
        request.setAttribute("messageType", messageType);

        request.getRequestDispatcher("markupdate.jsp").forward(request, response);
    }

    /**
     * Handles HTTP POST requests for updating a mark.
     * This is called when the markupdate.jsp form is submitted.
     *
     * @param request The HttpServletRequest object.
     * @param response The HttpServletResponse object.
     * @throws ServletException if a servlet-specific error occurs.
     * @throws IOException if an I/O error occurs.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message = "";
        String messageType = "";
        StudentMark updatedStudentMark = new StudentMark(); // Create an object to hold updated data

        try {
            // Retrieve form parameters
            int studentID = Integer.parseInt(request.getParameter("studentID"));
            String studentName = request.getParameter("studentName");
            String subject = request.getParameter("subject");
            int marks = Integer.parseInt(request.getParameter("marks"));
            String examDateStr = request.getParameter("examDate");

            // Set the ID to the object (it's read-only on the form, but needed for update)
            updatedStudentMark.setStudentID(studentID);
            updatedStudentMark.setStudentName(studentName);
            updatedStudentMark.setSubject(subject);
            updatedStudentMark.setMarks(marks);

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date examDate = null;
            try {
                examDate = formatter.parse(examDateStr);
                updatedStudentMark.setExamDate(examDate);
            } catch (ParseException e) {
                System.err.println("Date parsing error in UpdateMarkServlet doPost: " + e.getMessage());
                message = "Invalid date format. Please use ISO formatYYYY-MM-DD.";
                messageType = "error";
                request.setAttribute("studentMark", updatedStudentMark); // Send back current form data
                request.setAttribute("message", message);
                request.setAttribute("messageType", messageType);
                request.getRequestDispatcher("markupdate.jsp").forward(request, response);
                return;
            }

            // Use the DAO to update the mark in the database
            boolean success = markDAO.updateMark(updatedStudentMark);

            if (success) {
                message = "Student mark updated successfully for ID: " + studentID;
                messageType = "success";
                // Redirect to DisplayMarksServlet on successful update
                response.sendRedirect("DisplayMarksServlet?message=" +
                                      java.net.URLEncoder.encode(message, "UTF-8") +
                                      "&messageType=" + messageType);
                return; // Important: return after redirect
            } else {
                message = "Failed to update student mark for ID: " + studentID + ". Record might not exist or a database error occurred.";
                messageType = "error";
            }
        } catch (NumberFormatException e) {
            System.err.println("Number format error in UpdateMarkServlet doPost: " + e.getMessage());
            message = "Invalid input for Student ID or Marks. Please enter valid numbers.";
            messageType = "error";
            try {
                updatedStudentMark.setStudentID(Integer.parseInt(request.getParameter("studentID")));
            } catch (NumberFormatException ignored) { /* ignore if ID is also bad */ }
            request.setAttribute("studentMark", updatedStudentMark);
        } catch (Exception e) {
            System.err.println("An unexpected error occurred during mark update: " + e.getMessage());
            e.printStackTrace();
            message = "An unexpected error occurred: " + e.getMessage();
            messageType = "error";
            request.setAttribute("studentMark", updatedStudentMark);
        }

        // For errors, forward back to markupdate.jsp to display the message on the form
        request.setAttribute("message", message);
        request.setAttribute("messageType", messageType);
        request.setAttribute("studentMark", updatedStudentMark); // Pass the current form data back
        request.getRequestDispatcher("markupdate.jsp").forward(request, response);
    }
}
