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
        // Load and execute the SQL script
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
    }
}
