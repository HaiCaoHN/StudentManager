/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AttendanceDBContext;
import dal.GroupDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Attendance;
import model.Group;
import model.Student;

/**
 *
 * @author HAICAO
 */
public class ViewGroupAllAttendanceController extends BaseRequiredAuthenticationController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        GroupDBContext dbGroup = new GroupDBContext();
        String gid = request.getParameter("gid");
        Group group = new Group();
        group.setId(gid);
        group = dbGroup.get(group);
        StudentDBContext dbStudent = new StudentDBContext();
        AttendanceDBContext dbAttend = new AttendanceDBContext();
        ArrayList<Student> students = dbStudent.listStudentByGroup(group);
        ArrayList<Attendance> attends = dbAttend.list();
        
        for (Student student : students) {
            student.getAttends().clear();
            for (Attendance attend : attends) {
                if (gid.equals(attend.getSession().getGroup().getId()) &&
                        student.getId() == attend.getSid().getId()) {
                    student.getAttends().add(attend);
                }
            }
        }
        request.setAttribute("students", students);
        request.setAttribute("group", group);
        request.getRequestDispatcher("view/view_all_attendance.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
