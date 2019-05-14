/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.DateFood;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import utils.DateUtils;

/**
 *
 * @author pupil
 */
@Stateless
public class DateFoodFacade extends AbstractFacade<DateFood> {

    @PersistenceContext(unitName = "Ptvr16SitePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DateFoodFacade() {
        super(DateFood.class);
    }

    public List<DateFood> findForDate(Date time) {
        Date nextDay = DateUtils.plusDaysToDate(time, 1);
        try {
            return  em.createQuery("SELECT df FROM DateFood df WHERE df.date > :time AND df.date < :nextDay")
                    .setParameter("time", time)
                    .setParameter("nextDay", nextDay)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    
}
