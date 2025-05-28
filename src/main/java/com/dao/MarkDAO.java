// src/main/java/com/dao/MarkDAO.java
package com.dao;

import com.model.StudentMark; // Import the StudentMark model class
import java.util.List;        // Import List for returning collections of StudentMark objects

public interface MarkDAO {
    boolean addMark(StudentMark studentMark) throws Exception;
    boolean updateMark(StudentMark studentMark) throws Exception;
    boolean deleteMark(int studentID) throws Exception;

    StudentMark getMarkById(int studentID) throws Exception;

    List<StudentMark> getAllMarks() throws Exception;

    List<StudentMark> getMarksAbove(int threshold) throws Exception;

    List<StudentMark> getMarksBySubject(String subject) throws Exception;

    List<StudentMark> getTopNStudents(int limit) throws Exception;
    
}
