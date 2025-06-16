package com.ijse.gdse.api.model;

import com.ijse.gdse.api.dto.UserDTO;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserModel {
    public static boolean findUser(UserDTO userDTO, String role, BasicDataSource ds) {
        try {
            Connection connection =  ds.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select * from users where name = ? and password = ? and role = ?");
            preparedStatement.setString(1,userDTO.getName());
            preparedStatement.setString(2,userDTO.getPassword());
            preparedStatement.setString(3,role);
            ResultSet resultSet =  preparedStatement.executeQuery();

            if (resultSet.next()) {
                return true;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }


    public static boolean saveUser(UserDTO userDTO, BasicDataSource ds) {
        try {
            Connection connection =  ds.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("insert into users(name, password, role, email) values(?,?,?,?)");
            preparedStatement.setString(1,userDTO.getName());
            preparedStatement.setString(2,userDTO.getPassword());
            preparedStatement.setString(3,"employee");
            preparedStatement.setString(4,userDTO.getEmail());
            int i =  preparedStatement.executeUpdate();

            if (i > 0) {
                return true;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
}
