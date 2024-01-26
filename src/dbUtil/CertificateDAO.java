package dbUtil;

import com.model.Certificate;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;
import java.util.List;

public class CertificateDAO {

    private final JdbcTemplate jdbcTemplate;

    public CertificateDAO() {
        this.jdbcTemplate = new JdbcTemplate(getDataSource());
    }

    public DataSource getDataSource() {
        DriverManagerDataSource ds = new DriverManagerDataSource();
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost:3306/gogreen");
        ds.setUsername("root");
        ds.setPassword("");
        return ds;
    }

    public List<Certificate> getUserCertByYear(int userId, Integer selectedYear) {
    	String sql = "SELECT w.user_id, w.year, w.month " +
    	        "FROM WaterBill w " +
    	        "JOIN ElectricBill e ON w.user_id = e.user_id AND w.year = e.year AND w.month = e.month " +
    	        "JOIN RecycleBill r ON w.user_id = r.user_id AND w.year = r.year AND w.month = r.month " +
    	        "WHERE w.user_id = ? AND w.status = 'approved' " +
    	        "AND (w.year = ? OR ? IS NULL) " + // Check for the selected year if not null
    	        "GROUP BY w.year, w.month " +
    	        "HAVING COUNT(DISTINCT w.month) >= 6 AND COUNT(DISTINCT e.month) >= 6 AND COUNT(DISTINCT r.month) >= 6 " +
    	        "ORDER BY w.year DESC, w.month DESC";

        try {
            List<Certificate> certificateList;

            if (selectedYear != null) {
                certificateList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Certificate.class), userId, selectedYear);
            } else {
                certificateList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Certificate.class), userId);
            }

            return certificateList;

        } catch (DataAccessException e) {
            System.out.println("Error accessing the database: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}
