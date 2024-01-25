package dbUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.model.WaterBill;

public class WaterBillDAO {
    JdbcTemplate jdbct = new JdbcTemplate(getDataSource());

    public DataSource getDataSource() {
        DataSource ds = null;
        String dbURL = "jdbc:mysql://localhost:3306/gogreen";
        String username = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        ds = new DriverManagerDataSource(dbURL, username, password);
        return ds;
    }

    public int add(WaterBill bill) {
        String sql = "INSERT INTO waterbill(water_consumption, water_proof, year, month, carbon_footprint, user_id, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        Object args[] = { bill.getWaterConsumption(), bill.getWaterProof(), bill.getYear(), bill.getMonth(),
                bill.getCarbonFootprint(), bill.getUserId(), bill.getStatus() };
        int rowAffected = jdbct.update(sql, args);
        return rowAffected;
    }

    public WaterBill getWaterDataById(int waterId) {
        String sql = "SELECT * FROM waterbill WHERE waterId=?";
        WaterBill wbill = jdbct.queryForObject(sql, new BeanPropertyRowMapper<WaterBill>(WaterBill.class), waterId);
        return wbill;
    }

    public WaterBill getWaterDataByMonthYear(int userId, int month, int year) {
        try {
            String sql = "SELECT * FROM waterbill WHERE user_id=? AND month=? AND year=?";
            Object args[] = { userId, month, year };
            WaterBill wbill = jdbct.queryForObject(sql, new BeanPropertyRowMapper<WaterBill>(WaterBill.class), args);
            return wbill;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    public int updateWaterBill(WaterBill bill) {
        String sql = "UPDATE waterbill SET water_consumption=?, water_proof=?, carbon_footprint=?, status=? WHERE user_id=? AND month=? AND year=?";
        Object args[] = { bill.getWaterConsumption(), bill.getWaterProof(), bill.getCarbonFootprint(), bill.getStatus(),
                bill.getUserId(), bill.getMonth(), bill.getYear() };
        int rowAffect = jdbct.update(sql, args);
        return rowAffect;
    }

    public List<WaterBill> getUserMonthBillByYear(int year, int uid) {
        String sql = "SELECT * FROM waterbill WHERE year=? AND user_id=? ORDER BY month";
        Object args[] = { year, uid };

        try {
            List<WaterBill> wList = jdbct.query(sql, new BeanPropertyRowMapper<>(WaterBill.class), args);
            return wList;
        } catch (DataAccessException e) {
            System.out.println("Error accessing the database: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public List<WaterBill> getPendingWaterData() {
        String sql = "SELECT * FROM waterbill WHERE status='pending'";
        List<WaterBill> wbill = jdbct.query(sql, new BeanPropertyRowMapper<WaterBill>(WaterBill.class));
        return wbill;
    }

    public Map<String, Double> getWaterConsumpAndTotalCF(int year, int month) {
        String sql = "SELECT ROUND(SUM(carbon_footprint), 2) AS water_CF, ROUND(SUM(water_consumption), 2) AS water_consump FROM waterbill WHERE year = ? AND month = ? AND status = ?";
        Object[] args = { year, month, "approve" };

        SqlRowSet rowSet = jdbct.queryForRowSet(sql, args);

        Map<String, Double> result = new HashMap<>();

        if (rowSet.next()) {
            result.put("water_CF", rowSet.getDouble("water_CF"));
            result.put("water_consump", rowSet.getDouble("water_consump"));
        }

        return result;
    }
}
