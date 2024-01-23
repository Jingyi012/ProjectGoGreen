package dbUtil;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class CreateTable {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @PostConstruct
    public void initializeDatabase() {
        // Load and execute the SQL script to create the electricbill table
        jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS electricbill (" +
                "eid INT PRIMARY KEY AUTO_INCREMENT NOT NULL, " +
                "electric_consumption DOUBLE, " +
                "electricBill_proof BLOB, " +
                "year INT, " +
                "month INT, " +
                "carbon_footprint DOUBLE, " +
                "user_id INT FOREIGN KEY REFERENCES User(user_id), " +
                "status VARCHAR(20)" +
                ")");
        
        // Load and execute the SQL script to create the User table
        jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS User (" +
                "id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, " +
                "fisrtName VARCHAR(255) NOT NULL, " +
                "lastName VARCHAR(255) NOT NULL, "+
                "password VARCHAR(255) NOT NULL, " +
                "email VARCHAR(255) NOT NULL, " +
                "phoneNo VARCHAR(20), " +  
                "address VARCHAR(255), " +
                "category VARCHAR(50), " +
                "file BLOB, " + 
                "status VARCHAR(20), " +
                ")");

    }
}

