package dbUtil;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.model.RecycleBill;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;


public class RecycleBillDAO {
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());
	
	public DataSource getDataSource() {
		DataSource ds=null;
		
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
	
	public List<RecycleBill> getUserMonthBillByYear(int year, int uid) {
	    String sql = "SELECT * FROM recyclebill WHERE year=? AND user_id=? ORDER BY month";
	    Object args[] = {year, uid};

	    try {
	        List<RecycleBill> rList = jdbct.query(sql, new BeanPropertyRowMapper<>(RecycleBill.class), args);
	        return rList;
	    } catch (DataAccessException e) {
	        System.out.println("Error accessing the database: " + e.getMessage());
	        e.printStackTrace(); 
	        return null; 
	    }
	}
	
	public int add(RecycleBill recycleBill) {
		String sql = "INSERT INTO recyclebill (recycle_weight, recycleBill_proof, carbon_footprint, year, month, user_id, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";
		return jdbct.update(sql, recycleBill.getRecycle_weight(), recycleBill.getRecycleBill_proof(), 
                recycleBill.getCarbon_footprint(), recycleBill.getYear(), 
                recycleBill.getMonth(), recycleBill.getUser_id(), recycleBill.getStatus());
	}
	
	public RecycleBill getRecycleDataByMonthYear(int userId, int month, int year) {
		try {
			String sql = "SELECT * FROM recyclebill WHERE user_id=? and month=? and year=?";
			Object args[] = {userId, month, year};
			RecycleBill rbill = jdbct.queryForObject(sql, new BeanPropertyRowMapper<RecycleBill>(RecycleBill.class), args);
			return rbill;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public int editRecycleBill(RecycleBill recycleBill) {
		String sql ="update recyclebill set recycle_weight=?, recycleBill_proof=?, carbon_footprint=?, status=? where user_id=? and month=? and year=?";
		Object args[] = {recycleBill.getRecycle_weight(), recycleBill.getRecycleBill_proof(), recycleBill.getCarbon_footprint(), recycleBill.getStatus(), recycleBill.getUser_id(), recycleBill.getMonth(), recycleBill.getYear()};
		int rowAffect = jdbct.update(sql, args);
		return rowAffect;
	}
	
	public RecycleBill getRecycleDataById(int rid) 
    {
		String sql = "select * from recyclebill where rid=?";
		RecycleBill rbill = jdbct.queryForObject(sql, new BeanPropertyRowMapper<RecycleBill>(RecycleBill.class), rid);
		return rbill;
	}
	
	public RecycleBill getApprovedRecycleDataByMonthYear(int userId, int month, int year) {
		try {
			String sql = "select * from recycleBill where user_id=? and month=? and year=? and status='approve'";
			Object args[] = {userId, month, year};
			RecycleBill rbill = jdbct.queryForObject(sql, new BeanPropertyRowMapper<RecycleBill>(RecycleBill.class), args);
			return rbill;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public Map<String, Double> getRecycleWeightAndTotalCF(int year, int month) {
	    String sql = "SELECT ROUND(SUM(carbon_footprint), 2) AS recycle_CF, ROUND(SUM(recycle_weight), 2) AS recycle_weight FROM recycleBill WHERE year = ? AND month = ? AND status = ?";
	    Object[] args = {year, month, "approve"};

	    SqlRowSet rowSet = jdbct.queryForRowSet(sql, args);

	    Map<String, Double> result = new HashMap<>();

	    if (rowSet.next()) {
	        result.put("recycle_CF", rowSet.getDouble("recycle_CF"));
	        result.put("recycle_weight", rowSet.getDouble("recycle_weight"));
	    }

	    return result;
	}
}
