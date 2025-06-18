package com.ijse.gdse.api.dto;

import lombok.*;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ComplaintDTO {
    private int id;
    private String title;
    private String description;
    private String department;
    private String priority;
    private String status;
    private LocalDate createdDate;

    // Constructor without ID (for new entries)
    public ComplaintDTO(String title, String description, String department, String priority, String status, LocalDate createdDate) {
        this.title = title;
        this.description = description;
        this.department = department;
        this.priority = priority;
        this.status = status;
        this.createdDate = createdDate;
    }
}
