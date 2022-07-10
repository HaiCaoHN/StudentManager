
import dal.SessionDBContext;
import dal.TimeSlotDBContext;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import model.Lecture;
import model.Session;
import model.TimeSlot;
import model.Week;

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
        Week currentWeek = null;
        for (Week w : weeks) {
            for(int i=0; i< 6; i++) {
                if(w.getStartDate().plusDays(i).equals(today)) {
                    currentWeek = w;break;
                }
            }
        }
        SessionDBContext sessionDB = new SessionDBContext();
        Lecture lec = new Lecture();
        lec.setId("tuanVM");
        ArrayList<Session> sessions = sessionDB.listSessionByLecture(lec, currentWeek.getStartDate(), currentWeek.getEndDate());
        for(Session s: sessions) {
            System.out.println(s.getDate() +"-"+ s.getSlot().getSlot());
        }
        TimeSlotDBContext slotDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = slotDB.list();
        for (TimeSlot slot : slots) {
            System.out.println(slot.getSlot());
        }
        System.out.println("Week: " + currentWeek.getStartDate().toString() + "to" + currentWeek.getEndDate().toString());
    }
}
