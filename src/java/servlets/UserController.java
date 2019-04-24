/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entity.Food;
import entity.Cover;

import entity.RateFood;
import entity.User;
import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import securitylogic.RoleLogic;
import session.FoodFacade;
import session.CoverFoodFacade;

import session.RateFoodFacade;
import session.UserFacade;
import session.UserRolesFacade;
import utils.Encription;
import utils.PagePathLoader;

/**
 *
 * @author Melnikov
 */
@WebServlet(name = "UserController", urlPatterns = {
    "/showChangePassword",
    "/changePassword",
    "/showFood",
    "/createRate",
    
    
})
public class UserController extends HttpServlet {
    
    @EJB private FoodFacade foodFacade;
    @EJB private UserRolesFacade userRolesFacade;
    @EJB private UserFacade userFacade;
    @EJB private CoverFoodFacade coverFoodFacade;
    @EJB private RateFoodFacade rateFoodFacade;
   
  
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Encription encription = new Encription();
        Calendar c = new GregorianCalendar();
        
        HttpSession session = request.getSession(false);
        if(session == null){
            request.setAttribute("info", "Войдите!");
            request.getRequestDispatcher("/showLogin").forward(request, response);
        }
        User regUser = (User) session.getAttribute("regUser");
        if(regUser == null){
            request.setAttribute("info", "Войдите!");
            request.getRequestDispatcher("/showLogin").forward(request, response);
        }
        RoleLogic rl = new RoleLogic();
        boolean isRole = rl.isRole(RoleLogic.ROLE.USER.toString(), regUser);
        if(!isRole){
            request.setAttribute("info", "Вы должны залогиниться!");
            request.getRequestDispatcher("/showLogin").forward(request, response);
        }
        request.setAttribute("role", rl.getRole(regUser));
        
        String path = request.getServletPath();
        
        
        switch (path) {
            case "/showChangePassword":
                String username = regUser.getStudent().getName()+" "+regUser.getStudent().getSurname();
                request.setAttribute("username", username);
                String login = regUser.getLogin();
                request.setAttribute("login", login);
                request.getRequestDispatcher(PagePathLoader.getPagePath("changePassword")).forward(request, response);
                break;
            case "/changePassword":
                String oldPassword = request.getParameter("oldPassword");
                String encriptOldPassword = encription.getEncriptionPass(oldPassword);
                if(!encriptOldPassword.equals(regUser.getPassword())){
                    request.setAttribute("info", "Вы должны войти");
                    request.getRequestDispatcher("/showLogin").forward(request, response);
                    break;
                }
                String newPassword1 = request.getParameter("newPassword1");
                String newPassword2 = request.getParameter("newPassword2");
                if(newPassword1.equals(newPassword2)){
                    regUser.setPassword(encription.getEncriptionPass(newPassword1));
                    userFacade.edit(regUser);
                }
                request.setAttribute("info", "Вы успешно изменили пароль");
                request.getRequestDispatcher("/logout");
                request.getRequestDispatcher("/showLogin").forward(request, response);
                break;  
            case "/showFood":
                Cover cover = null;
                List<Food>listFoods=foodFacade.findAll();
                Map<Food,Cover>mapFoodCover=new HashMap<>();
                for(int i=0; i<listFoods.size(); i++){
                    cover=coverFoodFacade.findCover(listFoods.get(i));
                    mapFoodCover.put(listFoods.get(i), cover);
                }
                request.setAttribute("mapFoodCover", mapFoodCover);
                request.getRequestDispatcher(PagePathLoader.getPagePath("showFood")).forward(request, response);
                break;
            case "/createRate":
                String foodId = request.getParameter("foodId");
                String rateId = request.getParameter("rateId");
                Food food = foodFacade.find(new Long(foodId));
                
                RateFood rateFood = new RateFood (food, new Integer(rateId), c.getTime());
                rateFoodFacade.create(rateFood);
                request.setAttribute("info", "Отзыв \""+food.getName()+"\"добавлен");
                request.getRequestDispatcher(PagePathLoader.getPagePath("index")).forward(request, response);
                break;
        }
   }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
