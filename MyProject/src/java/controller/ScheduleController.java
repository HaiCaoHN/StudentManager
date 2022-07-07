/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.SessionDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import model.Lecture;
import model.Session;
import model.Week;

/**
 *
 * @author HAICAO
 */
public class ScheduleController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ScheduleController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScheduleController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ArrayList<Week> weeks = new ArrayList<>();
        LocalDate startDate = LocalDate.parse("03-01-2022",DateTimeFormatter.ofPattern("dd-MM-yyyy"));
        for(int i =0; i<365; i+=7) {
            LocalDate endDate = startDate.plusDays(6);
            Week week = new Week();
            week.setStartDate(startDate);
            week.setEndDate(endDate);
            weeks.add(week);
            startDate = endDate.plusDays(1);
        }
        LocalDate today = LocalDate.now();
        LocalDate start = LocalDate.parse("06-12-2022",DateTimeFormatter.ofPattern("dd-MM-yyyy"));
        LocalDate end = LocalDate.parse("12-12-2022",DateTimeFormatter.ofPattern("dd-MM-yyyy"));
        SessionDBContext sessionDB = new SessionDBContext();
        request.setAttribute("today", today);
        request.setAttribute("weeks", weeks);
        Lecture lec = new Lecture();
        lec.setId("tuanVM");
        ArrayList<Session> sessions = sessionDB.listSessionByLecture(lec, start, end);
        request.setAttribute("sessions", sessions);
        request.getRequestDispatcher("view/schedule.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ArrayList<Week> weeks = new ArrayList<>();
        LocalDate startDate = LocalDate.parse("03-01-2022",DateTimeFormatter.ofPattern("dd-MM-yyyy"));
        for(int i =0; i<365; i+=7) {
            LocalDate endDate = startDate.plusDays(6);
            Week week = new Week();
            week.setStartDate(startDate);
            week.setEndDate(endDate);
            weeks.add(week);
            startDate = endDate.plusDays(1);
        }
        LocalDate today = LocalDate.now();
        request.setAttribute("today", today);
        request.setAttribute("weeks", weeks);
        request.getRequestDispatcher("view/schedule.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
