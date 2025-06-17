package com.ijse.gdse.api.model;

import com.ijse.gdse.api.dto.UserDTO;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserModel {
    public static UserDTO findUser(UserDTO userDTO, String role, BasicDataSource ds) {
        try {
            Connection connection =  ds.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select * from users where name = ? and password = ? and role = ?");
            preparedStatement.setString(1,userDTO.getName());
            preparedStatement.setString(2,userDTO.getPassword());
            preparedStatement.setString(3,role);
            ResultSet resultSet =  preparedStatement.executeQuery();

            if (resultSet.next()) {
               return new UserDTO(resultSet.getInt("id"), resultSet.getString("name"),resultSet.getString("password"),resultSet.getString("role"),resultSet.getString("email"));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
            return null;
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

    public static UserDTO findUserId(UserDTO userDTO, String role, BasicDataSource dataSource) {
        try {
            Connection connection =  dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select * from users where name = ? and password = ? and role = ?");
            preparedStatement.setString(1,userDTO.getName());
            preparedStatement.setString(2,userDTO.getPassword());
            preparedStatement.setString(3,role);
            ResultSet resultSet = preparedStatement.executeQuery();
            return new UserDTO(resultSet.getInt("id"),resultSet.getString("name"),resultSet.getString("password"),resultSet.getString("role"),resultSet.getString("email"));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<UserDTO> getAll(BasicDataSource ds) {
        List<UserDTO> userList = new ArrayList<>();
        String sql = "SELECT * FROM users";

        try (Connection con = ds.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                UserDTO user = new UserDTO();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setJob(rs.getString("role")); // or setRole()
                user.setEmail(rs.getString("email"));
                userList.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }
}
