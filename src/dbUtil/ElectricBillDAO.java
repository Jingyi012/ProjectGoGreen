package dbUtil;

import java.util.Collections;
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

import com.model.ElectricBill;

public class ElectricBillDAO {
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());
	
	public DataSource getDataSource() {
		DataSource ds=null;
		String dbURL = "jdbc:mysql://localhost:3306/gogreen";
		String username = "root";
		String password = "";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e){
			e.printStackTrace();
		}
		ds = new DriverManagerDataSource(dbURL, username, password);
		return ds;
	}
	
	public int add(ElectricBill bill) {
		String sql = "insert into `electricbill`(electric_consumption, electricBill_proof, year, month, carbon_footprint, user_id, status) values (?,?,?,?,?,?,?)";
		Object args[] = {bill.getElectric_consumption(), bill.getElectricBill_proof(), bill.getYear(), bill.getMonth(), bill.getCarbon_footprint(), bill.getUser_id(), bill.getStatus()};
		int rowAffected = jdbct.update(sql,args);
		return rowAffected;
	}
	
	public ElectricBill getElectricDataById(int eid) 
    {
		String sql = "select * from electricbill where eid=?";
		ElectricBill ebill = jdbct.queryForObject(sql, new BeanPropertyRowMapper<ElectricBill>(ElectricBill.class), eid);
		return ebill;
	}
	
	public ElectricBill getElectricDataByMonthYear(int userId, int month, int year) {
		try {
			String sql = "select * from electricbill where user_id=? and month=? and year=?";
			Object args[] = {userId, month, year};
			ElectricBill ebill = jdbct.queryForObject(sql, new BeanPropertyRowMapper<ElectricBill>(ElectricBill.class), args);
			return ebill;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public ElectricBill getApprovedElectricDataByMonthYear(int userId, int month, int year) {
		try {
			String sql = "select * from electricbill where user_id=? and month=? and year=? and status='approve'";
			Object args[] = {userId, month, year};
			ElectricBill ebill = jdbct.queryForObject(sql, new BeanPropertyRowMapper<ElectricBill>(ElectricBill.class), args);
			return ebill;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public int updateElectricBill(ElectricBill bill) 
	{
		String sql ="update electricbill set electric_consumption=?, electricBill_proof=?, carbon_footprint=?, status=? where user_id=? and month=? and year=?";
		Object args[] = {bill.getElectric_consumption(), bill.getElectricBill_proof(), bill.getCarbon_footprint(), bill.getStatus(), bill.getUser_id(), bill.getMonth(), bill.getYear()};
		int rowAffect = jdbct.update(sql, args);
		return rowAffect;
	}
	
	public List<ElectricBill> getUserMonthBillByYear(int year, int uid) {
	    String sql = "SELECT * FROM electricbill WHERE year=? AND user_id=? ORDER BY month";
	    Object args[] = {year, uid};

	    try {
	        List<ElectricBill> eList = jdbct.query(sql, new BeanPropertyRowMapper<>(ElectricBill.class), args);
	        return eList;
	    } catch (DataAccessException e) {
	        System.out.println("Error accessing the database: " + e.getMessage());
	        e.printStackTrace(); 
	        return null; 
	    }
	}
	
	public List<ElectricBill> getPendingElectricData(){
		String sql = "select * from electricbill where status='pending'";
		List<ElectricBill> ebill = jdbct.query(sql, new BeanPropertyRowMapper<ElectricBill>(ElectricBill.class));
		return ebill;
	}
	
	public Map<String, Double> getElectricConsumpAndTotalCF(int year, int month) {
	    String sql = "SELECT ROUND(SUM(carbon_footprint), 2) AS electric_CF, ROUND(SUM(electric_consumption), 2) AS electric_consump FROM electricBill WHERE year = ? AND month = ? AND status = ?";
	    Object[] args = {year, month, "approve"};

	    SqlRowSet rowSet = jdbct.queryForRowSet(sql, args);

	    Map<String, Double> result = new HashMap<>();

	    if (rowSet.next()) {
	        result.put("electric_CF", rowSet.getDouble("electric_CF"));
	        result.put("electric_consump", rowSet.getDouble("electric_consump"));
	    }

	    return result;
	}
}
