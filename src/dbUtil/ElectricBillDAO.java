package dbUtil;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

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
	
	public ElectricBill getElectricData(ElectricBill bill) {
		String sql = "select * from electricbill where user_id=? and month=? and year=? and status=?";
		Object args[] = {bill.getUser_id(), bill.getMonth(), bill.getYear(), bill.getStatus()};
		ElectricBill ebill = jdbct.queryForObject(sql, new BeanPropertyRowMapper<ElectricBill>(ElectricBill.class), args);
		return ebill;
	}
	
	public ElectricBill getElectricDataByMonthYear(int userId, int month, int year) {
		String sql = "select * from electricbill where user_id=? and month=? and year=?";
		Object args[] = {userId, month, year};
		ElectricBill ebill = jdbct.queryForObject(sql, new BeanPropertyRowMapper<ElectricBill>(ElectricBill.class), args);
		return ebill;
	}
	
	public int updateElectricBill(ElectricBill bill) {
		String sql ="update electricbill set electric_consumption=?, electricBill_proof=?, carbon_footprint=?, status=? where user_id=? and month=? and year=?";
		Object args[] = {bill.getElectric_consumption(), bill.getElectricBill_proof(), bill.getCarbon_footprint(), bill.getStatus(), bill.getUser_id(), bill.getMonth(), bill.getYear()};
		int rowAffect = jdbct.update(sql, args);
		return rowAffect;
	}
	
	public List<ElectricBill> getUserMonthBillByYear(int year, int uid){
		String sql = "select * from electricbill where year=? and user_id=? order by month";
		Object args[] = {year, uid};
		List<ElectricBill> eList = jdbct.query(sql, new BeanPropertyRowMapper<ElectricBill>(ElectricBill.class), args);
		return eList;
	}
	
}
