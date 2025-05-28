// src/main/java/com/servlet/ReportCriteriaServlet.java
package com.servlet;

import com.dao.MarkDAO;        // Import the MarkDAO interface
import com.dao.MarkDAOImpl;    // Import the MarkDAOImpl implementation
import com.model.StudentMark;  // Import the StudentMark model class

import java.io.IOException;
import java.util.List;         // For List of StudentMark objects
import java.util.ArrayList;    // For creating an empty list

// IMPORTANT: Using javax.servlet for Tomcat 9.x compatibility
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReportCriteriaServlet
 * This servlet handles the submission of report criteria from report_form.jsp.
 * It determines the report type, fetches data using MarkDAOImpl, and forwards
 * the results to report_result.jsp for display.
 * Compatible with Tomcat 9.x (using javax.servlet imports).
 */
@WebServlet("/ReportCriteriaServlet") // Maps this servlet to the URL pattern /ReportCriteriaServlet
public class ReportCriteriaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MarkDAO markDAO;

    public ReportCriteriaServlet() {
        super();
        this.markDAO = new MarkDAOImpl();
    }

    /**
     * Handles HTTP GET requests. This method is called when the form on
     * report_form.jsp is submitted (using method="get").
     *
     * @param request The HttpServletRequest object.
     * @param response The HttpServletResponse object.
     * @throws ServletException if a servlet-specific error occurs.
     * @throws IOException if an I/O error occurs.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        List<StudentMark> reportResults = new ArrayList<>(); // Initialize an empty list for results
        String message = "";
        String messageType = "";
        String reportTitle = "Report Results"; // Default title

        try {
            if ("marksAbove".equals(reportType)) {
                reportTitle = "Students with Marks Above Threshold";
                String minMarksStr = request.getParameter("minMarks");
                if (minMarksStr != null && !minMarksStr.isEmpty()) {
                    int minMarks = Integer.parseInt(minMarksStr);
                    reportResults = markDAO.getMarksAbove(minMarks);
                    if (reportResults.isEmpty()) {
                        message = "No students found with marks above " + minMarks + ".";
                        messageType = "info"; // Use 'info' for no results, not 'error'
                    }
                } else {
                    message = "Minimum Marks is required for this report.";
                    messageType = "error";
                }
            } else if ("marksBySubject".equals(reportType)) {
                reportTitle = "Students' Marks by Subject";
                String subjectName = request.getParameter("subjectName");
                if (subjectName != null && !subjectName.isEmpty()) {
                    reportResults = markDAO.getMarksBySubject(subjectName);
                    if (reportResults.isEmpty()) {
                        message = "No students found for subject: '" + subjectName + "'.";
                        messageType = "info";
                    }
                } else {
                    message = "Subject Name is required for this report.";
                    messageType = "error";
                }
            } else if ("topNStudents".equals(reportType)) {
                reportTitle = "Top N Students";
                String nValueStr = request.getParameter("nValue");
                if (nValueStr != null && !nValueStr.isEmpty()) {
                    int nValue = Integer.parseInt(nValueStr);
                    reportResults = markDAO.getTopNStudents(nValue);
                    if (reportResults.isEmpty()) {
                        message = "No students found to generate top " + nValue + " report.";
                        messageType = "info";
                    }
                } else {
                    message = "Number of Top Students (N) is required for this report.";
                    messageType = "error";
                }
            } else {
                message = "Invalid report type selected.";
                messageType = "error";
            }
        } catch (NumberFormatException e) {
            message = "Invalid number format for report criteria. Please enter a valid number.";
            messageType = "error";
            System.err.println("Number format error in ReportCriteriaServlet: " + e.getMessage());
        } catch (Exception e) {
            message = "An unexpected error occurred while generating the report: " + e.getMessage();
            messageType = "error";
            System.err.println("Database error in ReportCriteriaServlet: " + e.getMessage());
            e.printStackTrace();
        }

        // Set attributes to be passed to the result JSP
        request.setAttribute("reportResults", reportResults);
        request.setAttribute("message", message);
        request.setAttribute("messageType", messageType);
        request.setAttribute("reportTitle", reportTitle); // Pass the dynamic title

        // Forward to the result JSP
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }

    /**
     * Handles HTTP POST requests. For report generation, GET is typically used
     * as criteria are passed in URL parameters. This method delegates to doGet.
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
