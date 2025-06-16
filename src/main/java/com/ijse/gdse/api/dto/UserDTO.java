package com.ijse.gdse.api.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserDTO {
    private String name;
    private String password;
    private String email;
    private String job;


    public UserDTO(String name, String password, String email) {
        this.name = name;
        this.password = password;
        this.email = email;
    }

    public UserDTO(String name, String password) {
        this.name = name;
        this.password = password;
    }
}
