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

@WebServlet("/signUps")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        String email = req.getParameter("email");

        // null check සහ හිස් String පරික්ෂාව
        if (name == null || password == null || email == null ||
                name.isBlank() || password.isBlank() || email.isBlank()) {
            resp.sendRedirect(req.getContextPath() + "/signup.jsp?error=missing");
            return;
        }

        // password encryption (BCrypt භාවිතය - යෝජනාදායකයි)
        // String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        BasicDataSource ds = (BasicDataSource) req.getServletContext().getAttribute("dataSource");

        // saveUser method එකට userDTO object එක යොමු කිරීම
        boolean issave = UserModel.saveUser(new UserDTO(name, password, email), ds);

        if (issave) {
            // register වීම සාර්ථක නම් login.jsp වෙත යොමු කිරීම
            resp.sendRedirect(req.getContextPath() + "/index.jsp?signup=success");
        } else {
            // save විය නොහැකි නම් error redirect
            resp.sendRedirect(req.getContextPath() + "/signup.jsp?error=exists");
        }
    }
}
