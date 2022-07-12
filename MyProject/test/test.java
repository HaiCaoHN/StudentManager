
import dal.EnrollDBContext;
import dal.SessionDBContext;
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
        EnrollDBContext db = new EnrollDBContext();
        SessionDBContext dbSession = new SessionDBContext();
        Session s = new Session();
        s.setId(12);
        Session session = dbSession.get(s);
        System.out.println(session.getRoom());
    }
}
