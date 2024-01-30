package dbUtil;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.model.WaterUserJoin;

public class WaterUserJoinDAO {
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());
	
	public DataSource getDataSource() {
		DataSource ds=null;
		String dbURL="jdbc:mysql://localhost:3306/gogreen";
		String username="root";
		String password="";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		ds = new DriverManagerDataSource(dbURL, username, password);
		return ds;
	}
	
	public List<WaterUserJoin> getAllPendingBill(){
		String sql = "select w.*, u.* from waterBill w join user u on w.user_id=u.id where w.status='pending'";
		List<WaterUserJoin> wuList=jdbct.query(sql,  new BeanPropertyRowMapper<WaterUserJoin>(WaterUserJoin.class));
		return wuList;
	}

}
