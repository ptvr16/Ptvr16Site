/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.Food;
import entity.Cover;
import entity.CoverFood;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Melnikov
 */
@Stateless
public class CoverFoodFacade extends AbstractFacade<CoverFood> {

    @PersistenceContext(unitName = "Ptvr16SitePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CoverFoodFacade() {
        super(CoverFood.class);
    }
    
    public Cover findCover(Food food) {
        try {
            CoverFood coverFood = (CoverFood) em.createQuery("SELECT cb FROM CoverFood cb WHERE cb.food = :food")
                    .setParameter("food", food)
                    .getSingleResult();
            return coverFood.getCover();
        } catch (Exception e) {
            return null;
        }
    }

   
    
}
