/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.RateFood;
import entity.User;
import entity.UserRoles;
import java.util.Date;
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

    public List<User> findRateUsers(Date date) {
        Date tomorrow = null;
        Date yesterday = null;
        
        try {
            return em.createQuery("SELECT rf FROM RateFood rf WHERE rf.date < :tomorrow AND rf.date > yesterday")
                .setParameter("tomorrow", tomorrow)
                .setParameter("yesterday",yesterday)
                .getResultList();
        } catch (Exception e) {
            return null;
        }
        
 
    }
    
}
