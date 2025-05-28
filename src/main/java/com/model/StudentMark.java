// src/main/java/com/model/StudentMark.java
package com.model;

import java.util.Date; // Import Date for the examDate field

public class StudentMark {
    // Private fields to store student mark details
    private int studentID;
    private String studentName;
    private String subject;
    private int marks;
    private Date examDate; // Using java.util.Date for the ExamDate

    /**
     * Default constructor.
     */
    public StudentMark() {
        // No-argument constructor, useful for frameworks or when creating an empty object.
    }

 
    public StudentMark(int studentID, String studentName, String subject, int marks, Date examDate) {
        this.studentID = studentID;
        this.studentName = studentName;
        this.subject = subject;
        this.marks = marks;
        this.examDate = examDate;
    }

    // --- Getter and Setter Methods ---
    // These methods provide controlled access to the private fields.

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getMarks() {
        return marks;
    }

    public void setMarks(int marks) {
        this.marks = marks;
    }

    public Date getExamDate() {
        return examDate;
    }

    public void setExamDate(Date examDate) {
        this.examDate = examDate;
    }

 
    @Override
    public String toString() {
        return "StudentMark{" +
               "studentID=" + studentID +
               ", studentName='" + studentName + '\'' +
               ", subject='" + subject + '\'' +
               ", marks=" + marks +
               ", examDate=" + examDate +
               '}';
    }
}