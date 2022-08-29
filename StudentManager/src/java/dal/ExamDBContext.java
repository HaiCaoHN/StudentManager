/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Assessment;
import model.Exam;
import model.Student;

/**
 *
 * @author mavjp
 */
public class ExamDBContext extends DBContext<Exam> {

    @Override
    public ArrayList<Exam> list() {
        ArrayList<Exam> exams = new ArrayList<>();
        try {
            String sql = "select A.* from (select s.sid, s.sname, e.examid, e.score, e.date, a.aid, a.aname from Student s \n"
                    + "						inner join Exam e on s.sid = e.sid\n"
                    + "						inner join Assessment a on a.aid = e.aid) A \n"
                    + "inner join \n"
                    + "(select sid, aid, MAX(date) as date from Exam GROUP BY sid,aid) B\n"
                    + "on A.sid = B.sid AND A.aid = B.aid AND A.date = B.date";
            PreparedStatement stm = conection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()) {
                Exam e = new Exam();
                e.setId(rs.getInt("examid"));
                e.setScore(rs.getFloat("score"));
                e.setDate(rs.getDate("date"));
                Assessment a = new Assessment();
                a.setId(rs.getInt("aid"));
                a.setName(rs.getString("aname"));
                Student s = new Student();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
                e.setAssess(a);
                e.setStu(s);
                exams.add(e);
            }
            return exams;
        } catch (SQLException ex) {
            Logger.getLogger(ExamDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Exam> list(String identity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Exam get(Exam entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Exam entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Exam entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Exam entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
