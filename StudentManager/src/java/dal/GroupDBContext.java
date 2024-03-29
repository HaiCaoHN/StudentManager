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
import model.Group;
import model.Lecture;
import model.Subject;

/**
 *
 * @author HAICAO
 */
public class GroupDBContext extends DBContext<Group> {

    public ArrayList<Group> listGroupByLecture(Lecture lec) {
        ArrayList<Group> list = new ArrayList<>();
        try {
            String sql = "select gid, subjectID, lectureID from [Group] where lectureID = ?";
            PreparedStatement stm = conection.prepareStatement(sql);
            stm.setString(1, lec.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setId(rs.getString("gid"));
                Subject sj = new Subject();
                sj.setId(rs.getString("subjectID"));
                g.setSubject(sj);
                g.setLecture(rs.getString("lectureID"));
                list.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public ArrayList<Group> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Group> list(String identity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Group get(Group entity) {
        try {
            String sql = "select gid,g.subjectID,totalSlot from [Group] g inner join [Subject] s on g.subjectID = s.subjectID \n"
                    + "where gid = ?";
            PreparedStatement stm = conection.prepareStatement(sql);
            stm.setString(1, entity.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setId(rs.getString("gid"));
                Subject s = new Subject();
                s.setId(rs.getString("subjectID"));
                s.setTotalSlot(rs.getInt("totalSlot"));
                g.setSubject(s);
                return g;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void insert(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
