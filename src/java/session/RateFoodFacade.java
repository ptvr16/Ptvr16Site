/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;


import entity.RateFood;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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

    public List<RateFood> findRateFoods(String day,String month, String year) {
        Calendar cToday = new GregorianCalendar(new Integer (year), new Integer (month) -1, new Integer (day));
        Date today = cToday.getTime();
        LocalDateTime localDateTime = Instant.ofEpochMilli(today.getTime()).atZone(ZoneId.systemDefault()).toLocalDateTime();
        LocalDateTime localDateTimePlusDay = localDateTime.plusDays(1);
        Date tomorow = Date.from(localDateTimePlusDay.atZone(ZoneId.systemDefault()).toInstant());
        
        try {
            List<RateFood> listRateFoods = em.createQuery("SELECT rf FROM RateFood rf WHERE rf.date > :today AND rf.date < :tomorow")
            .setParameter("today", today)
            .setParameter("tomorow", tomorow)
            .getResultList();
            return listRateFoods;
        } catch (Exception e) {
            Logger.getLogger(RateFoodFacade.class.getName()).log(Level.SEVERE, "Ошибка в запросе", e);
            return null;
        }
        
 
    }
    
}
