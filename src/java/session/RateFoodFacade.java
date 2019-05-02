/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.RateFood;
import entity.User;
import entity.UserRoles;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author pupil
 */
@Stateless
public class RateFoodFacade extends AbstractFacade<RateFood> {

    @PersistenceContext(unitName = "Ptvr16SitePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RateFoodFacade() {
        super(RateFood.class);
    }

    public List<User> findRateUsers(String day,String month, String year) {
//        Calendar now = new GregorianCalendar();
//        int year = now.get(Calendar.YEAR);
//        int month = now.get(Calendar.MONTH);
//        int day = now.get(Calendar.DAY_OF_MONTH);
        
        Calendar today = new GregorianCalendar(new Integer (year), new Integer (month), new Integer (day));
       // Calendar tomorrow_c = today_c.add(, 1);
        
      //  Date today = now.getTime();
      //  now.add(Calendar.DATE,1);
      // Date tomorrow = now.getTime();
       
        
        try {
            return em.createQuery("SELECT rf FROM RateFood rf WHERE rf.date > :today")
                .setParameter("today", today)
                .getResultList();
        } catch (Exception e) {
            return null;
        }
        
 
    }
    
}
