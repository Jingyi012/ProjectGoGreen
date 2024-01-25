package dbUtil;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.model.WaterBill;

public class WaterBillDAO {
    private final JdbcTemplate jdbcTemplate;

    public WaterBillDAO() {
        this.jdbcTemplate = new JdbcTemplate(getDataSource());
    }

    public DataSource getDataSource() {
        String dbURL = "jdbc:mysql://localhost:3306/gogreen";
        String username = "root";
        String password = "";

        DriverManagerDataSource dataSource = new DriverManagerDataSource(dbURL, username, password);
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        return dataSource;
    }

    public int add(WaterBill waterBill) {
        String sql = "INSERT INTO waterbill(year, month, user_id, water_consumption, water_proof, carbon_footprint, status) VALUES (?, ?, ?, ?, ?, ?, ?)";

        return jdbcTemplate.update(
                sql,
                waterBill.getYear(),
                waterBill.getMonth(),
                waterBill.getUserId(),
                waterBill.getWaterConsumption(),
                waterBill.getWaterProof(),
                waterBill.getCarbonFootprint(),
                waterBill.getStatus()
        );
    }

    public int updateWaterBill(WaterBill waterBill) {
        String sql = "UPDATE waterbill SET water_consumption=?, water_proof=?, carbon_footprint=?, status=? WHERE user_id=? AND month=? AND year=?";

        return jdbcTemplate.update(
                sql,
                waterBill.getWaterConsumption(),
                waterBill.getWaterProof(),
                waterBill.getCarbonFootprint(),
                waterBill.getStatus(),
                waterBill.getUserId(),
                waterBill.getMonth(),
                waterBill.getYear()
        );
    }

    public List<WaterBill> getUserMonthBillByYear(int year, int uid) {
        String sql = "SELECT * FROM waterbill WHERE year=? AND user_id=? ORDER BY month";
        Object args[] = {year, uid};

        try {
            return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(WaterBill.class), args);
        } catch (DataAccessException e) {
            // Handle or log the exception
            e.printStackTrace();
            return null;
        }
    }

    public WaterBill getWaterDataByMonthYear(int userId, int month, int year) {
        String sql = "SELECT * FROM waterbill WHERE user_id=? AND month=? AND year=?";
        Object args[] = {userId, month, year};

        try {
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(WaterBill.class), args);
        } catch (EmptyResultDataAccessException e) {
            // Handle or log the exception
            return null;
        }
    }
}
