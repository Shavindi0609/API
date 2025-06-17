package com.ijse.gdse.api.servlet;


import com.ijse.gdse.api.dto.UserDTO;
import com.ijse.gdse.api.model.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;

@WebServlet("/create")
public class CreateEmployeeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String name =  req.getParameter("name");
       String email = req.getParameter("email");
       String password = req.getParameter("password");

     BasicDataSource ds = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
      boolean isSave =  UserModel.saveUser(new UserDTO(name,password,email),ds);

      if (isSave){
          resp.sendRedirect(req.getContextPath()+"/employee.jsp");
      }
    }
}
