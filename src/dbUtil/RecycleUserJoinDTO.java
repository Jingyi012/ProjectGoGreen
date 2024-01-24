package dbUtil;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.model.ElectricUserJoin;
import com.model.RecycleUserJoin;

public class RecycleUserJoinDTO {
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
	
	public List<RecycleUserJoin> getAllPendingBill(){
		String sql = "select r.*, u.* from recyclebill r join user u on r.user_id = u.id where r.status='pending'";
		List<RecycleUserJoin> ruList = jdbct.query(sql, new BeanPropertyRowMapper<RecycleUserJoin>(RecycleUserJoin.class));
		return ruList;
	}

}
