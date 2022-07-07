
import dal.SessionDBContext;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import model.Lecture;
import model.Session;

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
        SessionDBContext sessionDB = new SessionDBContext();
        LocalDate start = LocalDate.parse("06-12-2022",DateTimeFormatter.ofPattern("dd-MM-yyyy"));
        LocalDate end = LocalDate.parse("12-12-2022",DateTimeFormatter.ofPattern("dd-MM-yyyy"));
        Lecture lec = new Lecture();
        lec.setId("tuanVM");
        ArrayList<Session> sessions = sessionDB.listSessionByLecture(lec, start, end);
        for (Session session : sessions) {
            System.out.println(session.getGroup().getId());
        }
    }

}
