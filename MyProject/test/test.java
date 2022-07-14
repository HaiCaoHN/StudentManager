
import dal.AccountDBContext;
import dal.EnrollDBContext;
import dal.SessionDBContext;
import java.util.ArrayList;
import model.Account;
import model.Feature;
import model.Role;
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
        AccountDBContext db = new AccountDBContext();
        Account a = db.getByUsernamePassword("sonnt", "sonnt");
        System.out.println(a.getUsername() + ',' + a.getDisplayName());
        for (Role role : a.getRoles()) {
            System.out.println(role.getName());
            ArrayList<Feature> flist = role.getFeatures();
            for (Feature feature : flist) {
                System.out.println(feature);
            }
        }
    }
}
