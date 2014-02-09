/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sa.edu.kfupm.sapms.servlet;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import sa.edu.kfupm.sapms.data.SAPMS_Login_V1;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "SAPMS_V3", urlPatterns = {"/SAPMS_V3", "/sapms-svc"})
public class SAPMS_V3 extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final ResourceLoader RESOURCE_LOADER = new ResourceLoader();

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
            throws ServletException, IOException
    {

        String cmd = request.getParameter("cmd");
        if (cmd != null)
        {
            if (cmd.equals("login"))
            {
                login(request, response);
            } else if (cmd.equals("loadPage"))
            {
                loadPage(request, response);
            } else if (cmd.equals("loadScript"))
            {
                loadScript(request, response);
            }
        }

        
        
    }

    private void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        SAPMS_Login_V1 l = new SAPMS_Login_V1();
        if (email.equals("adelahmed@kfupm.edu.sa") && password.equals("network"))
        {
            l.setEmail(email);;
            l.setKfupmID(email);
            l.setKfupmID(email.substring(0, email.indexOf("@")));
            l.setUserType("FACULTY");
            l.setLoginStatus("SUCCESS");
        } else if (email.toLowerCase().startsWith("s20"))
        {
            l.setEmail(email);
            l.setKfupmID(email);
            l.setKfupmID(email.substring(1, email.indexOf("@")));
            l.setUserType("STUDENT");
            l.setLoginStatus("SUCCESS");
        }

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        try
        {
            Gson gson = new Gson();
            out.printf(gson.toJson(l));
        } finally
        {
            out.close();
        }
    }
    
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
            throws ServletException, IOException
    {
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
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo()
    {
        return "Short description";
    }// </editor-fold>

    
    private void loadPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String path = request.getParameter("path");
        String framework = request.getParameter("framework");
        
        String params = request.getParameter("params");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            out.write(RESOURCE_LOADER.getPage(framework + "/" + path, processParameters(params)));
        } finally
        {
            out.close();
        }
    }

    private void loadScript(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String path = request.getParameter("path");
        String framework = request.getParameter("framework");
        response.setContentType("text/javascript");
        PrintWriter out = response.getWriter();
        try
        {
            out.write(RESOURCE_LOADER.getJavaScript(framework + "/" + path));
        } finally
        {
            out.close();
        }
    }

    private List<NameValuePair> processParameters(String params)
    {
        // parameters are a list of type
        // name:value,name:value,name:value
        if (params == null || params.length() == 0)
        {
            return new ArrayList<NameValuePair>();
        }
        List<NameValuePair> paramList = new ArrayList<NameValuePair>();
        StringTokenizer pairs = new StringTokenizer(params, ",");
        while (pairs.hasMoreTokens())
        {
            StringTokenizer nameValue = new StringTokenizer(pairs.nextToken(), ":");
            BasicNameValuePair pair = new BasicNameValuePair(nameValue.nextToken(), nameValue.nextToken());
            paramList.add(pair);
        }
        return paramList;
    } 
}
