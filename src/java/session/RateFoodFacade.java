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

    public List<User> findRateUsers(String date) {
        Calendar c= new GregorianCalendar();
        Calendar today_c = new GregorianCalendar(c.YEAR, c.MONTH, new Integer(date));
        Calendar tomorrow_c = new GregorianCalendar(c.YEAR, c.MONTH, new Integer(date)+1);
        
        Date today = today_c.getTime();
        Date tomorrow = tomorrow_c.getTime();
        
        try {
            return em.createQuery("SELECT rf FROM RateFood rf WHERE rf.date > :today AND rf.date < tomorrow")
                .setParameter("today", today)
                .setParameter("tomorrow",tomorrow)
                .getResultList();
        } catch (Exception e) {
            return null;
        }
        
 
    }
    
}
