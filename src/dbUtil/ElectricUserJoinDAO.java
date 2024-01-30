package dbUtil;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.model.ElectricUserJoin;

public class ElectricUserJoinDAO {
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
	
	public List<ElectricUserJoin> getAllPendingBill(){
		String sql = "select e.*, u.* from electricBill e join user u on e.user_id = u.id where e.status='pending'";
		List<ElectricUserJoin> euList = jdbct.query(sql, new BeanPropertyRowMapper<ElectricUserJoin>(ElectricUserJoin.class));
		return euList;
	}
}
