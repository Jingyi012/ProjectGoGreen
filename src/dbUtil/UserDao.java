package dbUtil;

import java.util.Collections;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.model.User;

public class UserDao {

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

	public int add(User user) {
		String sql = "insert into `user`( firstName, file, ic, email, phoneNo, category,address,lastName,password,status,role,area,ic_card,people) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object args[] = { user.getFirstName(), user.getFile(), user.getIc(), user.getEmail(), user.getPhoneNo(),
				user.getCategory(), user.getAddress(), user.getLastName(), user.getPassword(), "pending",
				user.getRole(), user.getArea(), user.getIc_card(), user.getPeople() };
		int rowAffected = jdbct.update(sql, args);
		return rowAffected;
	}

	public int deleteById(int userId) {
		String sql = "DELETE FROM user WHERE id = ?";
		Object[] args = { userId };
		return jdbct.update(sql, args);
	}

	public User getUserByIcAndPassword(String ic, String password) {
		try {
			String sql = "select * from user where ic=? and password=?";
			Object args[] = { ic, password };
			User user = jdbct.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), args);
			return user;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public User getUserById(int userId) {
		try {
			String sql = "select * from user where id=?";
			Object args[] = { userId };
			User user = jdbct.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), args);
			return user;
		} catch (Exception e) {
			return null;
		}
	}

	public User getUserByIc(String ic, String email) {
		try {
			String sql = "select * from user where ic=? and email=?";
			Object args[] = { ic, email };
			User user = jdbct.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), args);
			return user;
		} catch (Exception e) {
			// Handle exceptions or return null if user not found
			return null;
		}
	}
//
//	public List<User> getUsersByIdAndName(int id, String firstName) {
//		try {
//			String sql = "SELECT * FROM user WHERE id=? AND firstName=?";
//			Object[] args = { id, firstName };
//			List<User> users = jdbct.query(sql, new BeanPropertyRowMapper<>(User.class), args);
//			return users;
//		} catch (Exception e) {
//			e.printStackTrace();
//			return Collections.emptyList();
//		}
//	}
	
	// need check
	public int updateUser(User user) {
		try {
			String sql = "update user set firstName = ?, lastName = ?, email = ?, phoneNo=?, address=?, category=?,area=?, people=? where id=?";

			Object args[] = { user.getFirstName(), user.getLastName(), user.getEmail(), user.getPhoneNo(),
					user.getAddress(), user.getCategory(),user.getArea(), user.getPeople(), user.getId()};
			int rowsAffected = jdbct.update(sql, args);

			System.out.println("Rows affected: " + rowsAffected);

			return rowsAffected;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int updateUserStatus(int user_id, String status) {
		try {
			String sql = "UPDATE user SET status = ? WHERE id = ?";
			Object args[] = { status, user_id };
			int rowsAffected = jdbct.update(sql, args);

			System.out.println("Rows affected: " + rowsAffected);

			return rowsAffected;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

//	public List<String> getAllUserFirstNames() {
//		try {
//			String sql = "SELECT firstName FROM user WHERE status = 'pending'";
//			return jdbct.queryForList(sql, String.class);
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//	}

	public List<User> getUsersByStatus() {
		try {
			String sql = "SELECT * FROM user WHERE status = 'pending'";
			return jdbct.query(sql, new BeanPropertyRowMapper<>(User.class));
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

//	public List<String> getAllUserLastNames() {
//		try {
//			String sql = "SELECT lastName FROM user WHERE status = 'pending'";
//			return jdbct.queryForList(sql, String.class);
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//	}

//	public List<Map<String, Object>> getUsersByUserNames(List<String> userNames) {
//		try {
//			String sql = "SELECT * FROM user WHERE userName IN (:userNames)";
//			MapSqlParameterSource parameters = new MapSqlParameterSource();
//			parameters.addValue("userNames", userNames);
//
//			return jdbct.queryForList(sql, parameters, new BeanPropertyRowMapper<User>(User.class));
//		} catch (Exception e) {
//			e.printStackTrace();
//			return Collections.emptyList();
//		}
//	}

	public int ResetPassword(User user) {
		try {
			String sql = "UPDATE user SET password = ? WHERE email = ? AND ic = ? ";

			Object args[] = { user.getPassword(), user.getEmail(), user.getIc() };
			int rowsAffected = jdbct.update(sql, args);

			System.out.println("Rows affected: " + rowsAffected);

			return rowsAffected;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

//	public boolean isIcAndPasswordExists(String identificationCard, String password) {
//		String sql = "SELECT COUNT(*) FROM user WHERE ic = ? AND password = ?";
//		int count = jdbct.queryForObject(sql, Integer.class, identificationCard, password);
//		return count > 0;
//	}

	public boolean isIcExists(String identificationCard) {
		String sql = "SELECT COUNT(*) FROM user WHERE ic = ?";
		int count = jdbct.queryForObject(sql, Integer.class, identificationCard);
		return count > 0;
	}

}