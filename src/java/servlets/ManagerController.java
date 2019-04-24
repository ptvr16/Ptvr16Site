/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entity.Food;
import entity.Cover;
import entity.CoverFood;
import entity.Student;
import entity.User;
import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
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
import session.CoverFacade;
import session.StudentFacade;
import session.UserRolesFacade;
import utils.PagePathLoader;

/**
 *
 * @author jvm
 */
@WebServlet(name = "ManagerController", urlPatterns = {
    "/showListStudents",
    "/showAddNewFood",
    "/addNewFood",
    "/showUploadFile",
    "/historyFood",
    
})
public class ManagerController extends HttpServlet {
    @EJB private FoodFacade foodFacade;
    @EJB private StudentFacade studentFacade;
    @EJB private UserRolesFacade userRolesFacade;
    @EJB private CoverFacade coverFacade;
    @EJB private CoverFoodFacade coverFoodFacade;
    
    
    
    
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
        RoleLogic rl = new RoleLogic();
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
        Boolean isRole = rl.isRole(RoleLogic.ROLE.MANAGER.toString(), regUser);
        if(!isRole){
            request.setAttribute("info", "Вы должны быть менеджером!");
            request.getRequestDispatcher("/showLogin").forward(request, response);
        }
        
        request.setAttribute("role", rl.getRole(regUser));
        
        String path = request.getServletPath();
        
        switch (path) {
            case "/showListStudents":
                List<Student> listStudents = studentFacade.findAll();
                request.setAttribute("listStudents", listStudents);
                request.setAttribute("info", "showListStudents,привет из сервлета!");
                request.getRequestDispatcher(PagePathLoader.getPagePath("showListStudents")).forward(request, response);
                break;
            case "/showAddNewFood":
                List<Cover> listCovers = coverFacade.findAll();
                request.setAttribute("listCovers", listCovers);
                request.getRequestDispatcher(PagePathLoader.getPagePath("showAddNewFood")).forward(request, response);
                break;
            case "/addNewFood":
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                //String rate = request.getParameter("rate");
                Food food = new Food(name, description);
                foodFacade.create(food);
                String coverId = request.getParameter("coverId");
                Cover cover = coverFacade.find(new Long(coverId));
                CoverFood coverFood = new CoverFood(food, cover);
                coverFoodFacade.create(coverFood);
                request.setAttribute("info", "Блюдо \""+food.getName()+"\"добавлено");
                request.getRequestDispatcher(PagePathLoader.getPagePath("managerIndex")).forward(request, response);
                break;
            case "/showUploadFile":
                request.getRequestDispatcher(PagePathLoader.getPagePath("showUploadFile")).forward(request, response);
                break;
            default:   
                request.setAttribute("info", "Нет такой странички");
                request.getRequestDispatcher(PagePathLoader.getPagePath("managerIndex")).forward(request, response);
             
            case "/historyFood":
                listStudents = studentFacade.findAll();
                request.setAttribute("listStudents", listStudents);
                request.getRequestDispatcher(PagePathLoader.getPagePath("historyFood")).forward(request, response);
            
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
