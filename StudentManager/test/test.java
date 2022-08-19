
import dal.AttendanceDBContext;
import java.util.ArrayList;
import model.Attendance;
import model.Group;





/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author HAICAO
 */
public class test {

    public static void main(String[] args) {
        Group g = new Group();
        g.setId("SE1651-PRJ");
        AttendanceDBContext db = new AttendanceDBContext();
        ArrayList<Attendance> list = db.list();
        for (Attendance attendance : list) {
            System.out.println(attendance.getSession().getId());
        }
        
    }
}
