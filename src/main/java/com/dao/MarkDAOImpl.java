// src/main/java/com/dao/MarkDAOImpl.java
package com.dao;

import com.model.StudentMark;   // Import the StudentMark model class
import java.sql.Connection;     // For database connection
import java.sql.DriverManager;  // For managing JDBC drivers
import java.sql.PreparedStatement; // For pre-compiled SQL statements
import java.sql.ResultSet;      // For results of SQL queries
import java.sql.SQLException;   // For SQL exceptions
import java.sql.Statement;      // For executing static SQL statements
import java.util.ArrayList;     // For dynamic lists of StudentMark objects
import java.util.List;          // For the List interface
import java.util.Date;          // For java.util.Date (used in StudentMark)

/**
 * The MarkDAOImpl class provides the concrete implementation of the MarkDAO interface
 * using JDBC (Java Database Connectivity) to interact with a MySQL database.
 *
 * This version is configured with typical default settings for MySQL within XAMPP.
 *
 * IMPORTANT:
 * 1. You MUST replace the database connection details (DB_URL, USER, PASS)
 * if your XAMPP MySQL setup is different from the defaults (e.g., if you've set a password for 'root').
 * 2. Ensure you have the 'mysql-connector-java.jar' (MySQL JDBC driver)
 * added to your project's 'WebContent/WEB-INF/lib' folder AND configured
 * in your project's Build Path in Eclipse.
 * (Right-click Project -> Properties -> Java Build Path -> Libraries -> Add External JARs...)
 */
public class MarkDAOImpl implements MarkDAO {

    // --- Database Connection Details for XAMPP MySQL Default ---(?useSSL=false&serverTimezone=UTC)
    private static final String DB_URL = "jdbc:mysql://localhost:3306/mark_management_db";
    private static final String USER = "root"; // Default username for XAMPP MySQL
    private static final String PASS = ""; // Default empty password for XAMPP MySQL (often)

    // JDBC Driver Name for MySQL
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";

    static {
        try {
            Class.forName(JDBC_DRIVER);
            System.out.println("MySQL JDBC Driver registered successfully!");
        } catch (ClassNotFoundException e) {
            System.err.println("ERROR: MySQL JDBC Driver '" + JDBC_DRIVER + "' not found in classpath!");
            System.err.println("Please ensure 'mysql-connector-java.jar' is correctly added to WEB-INF/lib and Project Build Path.");
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, USER, PASS);
    }

    @Override
    public boolean addMark(StudentMark studentMark) throws Exception {
        String sql = "INSERT INTO StudentMarks (StudentID, StudentName, Subject, Marks, ExamDate) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, studentMark.getStudentID());
            pstmt.setString(2, studentMark.getStudentName());
            pstmt.setString(3, studentMark.getSubject());
            pstmt.setInt(4, studentMark.getMarks());
            pstmt.setDate(5, new java.sql.Date(studentMark.getExamDate().getTime()));

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) { // MySQL duplicate entry error code
                System.err.println("Duplicate Student ID detected: " + studentMark.getStudentID());
                return false; // Indicate failure due to duplicate ID
            } else {
                System.err.println("General SQL Error adding mark for Student ID " + studentMark.getStudentID() + ": " + e.getMessage());
                e.printStackTrace();
                throw new Exception("Database error while adding mark.", e);
            }
        }
    }

    @Override
    public boolean updateMark(StudentMark studentMark) throws Exception {
        String sql = "UPDATE StudentMarks SET StudentName = ?, Subject = ?, Marks = ?, ExamDate = ? WHERE StudentID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, studentMark.getStudentName());
            pstmt.setString(2, studentMark.getSubject());
            pstmt.setInt(3, studentMark.getMarks());
            pstmt.setDate(4, new java.sql.Date(studentMark.getExamDate().getTime()));
            pstmt.setInt(5, studentMark.getStudentID());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("SQL Error updating mark for Student ID " + studentMark.getStudentID() + ": " + e.getMessage());
            e.printStackTrace();
            throw new Exception("Database error while updating mark.", e);
        }
    }

    @Override
    public boolean deleteMark(int studentID) throws Exception {
        String sql = "DELETE FROM StudentMarks WHERE StudentID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, studentID); // Set the StudentID for deletion

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0; // Returns true if 1 or more rows were deleted
        } catch (SQLException e) {
            System.err.println("Error deleting mark for Student ID " + studentID + ": " + e.getMessage());
            e.printStackTrace();
            throw new Exception("Database error while deleting mark.", e);
        }
    }


  
    @Override
    public StudentMark getMarkById(int studentID) throws Exception {
        StudentMark studentMark = null;
        String sql = "SELECT StudentID, StudentName, Subject, Marks, ExamDate FROM StudentMarks WHERE StudentID = ?";

        // --- DEBUG PRINT ---
        System.out.println("MarkDAOImpl: getMarkById called for studentID = " + studentID);

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, studentID);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    // --- DEBUG PRINT ---
                    System.out.println("MarkDAOImpl: ResultSet found a record for studentID " + studentID);
                    studentMark = new StudentMark();
                    studentMark.setStudentID(rs.getInt("StudentID"));
                    studentMark.setStudentName(rs.getString("StudentName"));
                    studentMark.setSubject(rs.getString("Subject"));
                    studentMark.setMarks(rs.getInt("Marks"));
                    studentMark.setExamDate(rs.getDate("ExamDate"));
                } else {
                    // --- DEBUG PRINT ---
                    System.out.println("MarkDAOImpl: ResultSet found NO record for studentID " + studentID);
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Error fetching mark by ID " + studentID + ": " + e.getMessage());
            e.printStackTrace();
            throw new Exception("Database error while fetching mark by ID.", e);
        }
        return studentMark;
    }

    @Override
    public List<StudentMark> getAllMarks() throws Exception {
        List<StudentMark> studentMarks = new ArrayList<>();
        String sql = "SELECT StudentID, StudentName, Subject, Marks, ExamDate FROM StudentMarks ORDER BY StudentID ASC";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                StudentMark studentMark = new StudentMark();
                studentMark.setStudentID(rs.getInt("StudentID"));
                studentMark.setStudentName(rs.getString("StudentName"));
                studentMark.setSubject(rs.getString("Subject"));
                studentMark.setMarks(rs.getInt("Marks"));
                studentMark.setExamDate(rs.getDate("ExamDate"));
                studentMarks.add(studentMark);
            }
        } catch (SQLException e) {
            System.err.println("Error getting all marks: " + e.getMessage());
            e.printStackTrace();
            throw new Exception("Database error while retrieving all marks.", e);
        }
        return studentMarks;
    }


    @Override
    public List<StudentMark> getMarksAbove(int threshold) throws Exception {
        List<StudentMark> studentMarks = new ArrayList<>();
        String sql = "SELECT StudentID, StudentName, Subject, Marks, ExamDate FROM StudentMarks WHERE Marks > ? ORDER BY Marks DESC";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, threshold);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    StudentMark studentMark = new StudentMark();
                    studentMark.setStudentID(rs.getInt("StudentID"));
                    studentMark.setStudentName(rs.getString("StudentName"));
                    studentMark.setSubject(rs.getString("Subject"));
                    studentMark.setMarks(rs.getInt("Marks"));
                    studentMark.setExamDate(rs.getDate("ExamDate"));
                    studentMarks.add(studentMark);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting marks above threshold (" + threshold + "): " + e.getMessage());
            e.printStackTrace();
            throw new Exception("Database error while retrieving marks above threshold.", e);
        }
        return studentMarks;
    }

    @Override
    public List<StudentMark> getMarksBySubject(String subject) throws Exception {
        List<StudentMark> studentMarks = new ArrayList<>();
        String sql = "SELECT StudentID, StudentName, Subject, Marks, ExamDate FROM StudentMarks WHERE Subject = ? ORDER BY StudentID ASC";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, subject);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    StudentMark studentMark = new StudentMark();
                    studentMark.setStudentID(rs.getInt("StudentID"));
                    studentMark.setStudentName(rs.getString("StudentName"));
                    studentMark.setSubject(rs.getString("Subject"));
                    studentMark.setMarks(rs.getInt("Marks"));
                    studentMark.setExamDate(rs.getDate("ExamDate"));
                    studentMarks.add(studentMark);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting marks by subject (" + subject + "): " + e.getMessage());
            e.printStackTrace();
            throw new Exception("Database error while retrieving marks by subject.", e);
        }
        return studentMarks;
    }

    @Override
    public List<StudentMark> getTopNStudents(int limit) throws Exception {
        List<StudentMark> studentMarks = new ArrayList<>();
        String sql = "SELECT StudentID, StudentName, Subject, Marks, ExamDate FROM StudentMarks ORDER BY Marks DESC, StudentName ASC LIMIT ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, limit);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    StudentMark studentMark = new StudentMark();
                    studentMark.setStudentID(rs.getInt("StudentID"));
                    studentMark.setStudentName(rs.getString("StudentName"));
                    studentMark.setSubject(rs.getString("Subject"));
                    studentMark.setMarks(rs.getInt("Marks"));
                    studentMark.setExamDate(rs.getDate("ExamDate"));
                    studentMarks.add(studentMark);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting top " + limit + " students: " + e.getMessage());
            e.printStackTrace();
            throw new Exception("Database error while retrieving top N students.", e);
        }
        return studentMarks;
    }
}
