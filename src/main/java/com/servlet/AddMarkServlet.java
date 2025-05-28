// src/main/java/com/servlet/AddMarkServlet.java
package com.servlet;

import com.dao.MarkDAO;         // Import the MarkDAO interface
import com.dao.MarkDAOImpl;     // Import the MarkDAOImpl implementation
import com.model.StudentMark;   // Import the StudentMark model
import java.io.IOException;     // For handling I/O exceptions
import java.text.ParseException; // For date parsing exceptions
import java.text.SimpleDateFormat; // For formatting and parsing dates
import java.util.Date;          // For java.util.Date
import javax.servlet.ServletException; // For servlet exceptions
import javax.servlet.annotation.WebServlet; // For servlet annotation (alternative to web.xml)
import javax.servlet.http.HttpServlet;     // Base class for HTTP servlets
import javax.servlet.http.HttpServletRequest; // HTTP request object
import javax.servlet.http.HttpServletResponse; // HTTP response object

/**
 * Servlet implementation class AddMarkServlet
 * This servlet handles requests to add new student marks to the system.
 * It receives form data from markadd.jsp, creates a StudentMark object,
 * and uses MarkDAO to persist it to the database.
 */
@WebServlet("/addMark") // Annotation to map this servlet to the URL pattern /addMark
public class AddMarkServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // Recommended for servlets

    private MarkDAO markDAO; // Declare an instance of the DAO

    /**
     * Initializes the servlet. This method is called once when the servlet is created.
     */
    @Override
    public void init() throws ServletException {
        super.init();
        // Initialize the MarkDAO implementation
        // In a real application, you might use a dependency injection framework here.
        markDAO = new MarkDAOImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String message = ""; // Initialize message
        String messageType = ""; // Initialize message type

        try {
            // Retrieve form parameters
            int studentID = Integer.parseInt(request.getParameter("studentID"));
            String studentName = request.getParameter("studentName");
            String subject = request.getParameter("subject");
            int marks = Integer.parseInt(request.getParameter("marks"));
            String examDateStr = request.getParameter("examDate");

            // Parse date string
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date examDate = null;
            try {
                examDate = formatter.parse(examDateStr);
            } catch (ParseException e) {
                System.err.println("Date parsing error: " + e.getMessage());
                message = "Invalid date format. Please use YYYY-MM-DD.";
                messageType = "error";
                // Set attributes and forward, then return to stop further processing
                request.setAttribute("message", message);
                request.setAttribute("messageType", messageType);
                request.getRequestDispatcher("markadd.jsp").forward(request, response);
                return;
            }

            // Create a StudentMark object
            StudentMark studentMark = new StudentMark(studentID, studentName, subject, marks, examDate);

            // Call the DAO to add the mark to the database
            boolean success = markDAO.addMark(studentMark); // This will now return false for duplicate IDs

            if (success) {
                message = "Mark added successfully for Student ID: " + studentID;
                messageType = "success";
            } else {
                // If success is false, it means it was a duplicate ID based on our DAO change
                message = "Failed to add mark. Student ID " + studentID + " already exists. Please use a unique ID.";
                messageType = "error";
            }
        } catch (NumberFormatException e) {
            System.err.println("Number format error: " + e.getMessage());
            message = "Invalid input for Student ID or Marks. Please enter valid numbers.";
            messageType = "error";
        } catch (Exception e) {
            // Catch any other exceptions (e.g., from DAO - general database errors)
            System.err.println("An unexpected error occurred while adding the mark: " + e.getMessage());
            e.printStackTrace();
            message = "An unexpected error occurred: " + e.getMessage();
            messageType = "error";
        }

        // Set the message and type as request attributes to be displayed on the JSP
        request.setAttribute("message", message);
        request.setAttribute("messageType", messageType);

        // Forward the request back to markadd.jsp to display the message
        request.getRequestDispatcher("markadd.jsp").forward(request, response);
    }


    /**
     * Handles HTTP GET requests.
     * For adding marks, GET requests might simply display the form.
     *
     * @param request  The HttpServletRequest object.
     * @param response The HttpServletResponse object.
     * @throws ServletException if a servlet-specific error occurs.
     * @throws IOException      if an I/O error occurs.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // For a GET request to /addMark, simply forward to the JSP to display the form.
        request.getRequestDispatcher("markadd.jsp").forward(request, response);
    }
}
