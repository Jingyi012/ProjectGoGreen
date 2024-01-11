package dbUtil;

import java.util.*;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.model.AreaCarbon;
import com.model.ElectricUserJoin;

public class AreaCarbonDTO {
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
	
	public List<AreaCarbon> getAreaCarbonData() {
		try {
	        String sql = "SELECT areas.area," +
	                "COUNT(u.id) AS num_participant, " +
	                "COALESCE(SUM(CASE WHEN e.status = 'approve' THEN e.electric_consumption ELSE 0 END), 0) AS electric_consumption, " +
	                "COALESCE(SUM(CASE WHEN w.status = 'approve' THEN w.water_consumption ELSE 0 END), 0) AS water_consumption, " +
	                "COALESCE(SUM(CASE WHEN r.status = 'approve' THEN r.recycle_weight ELSE 0 END), 0) AS recycle_weight, " +
	                "COALESCE(SUM(CASE WHEN e.status = 'approve' THEN e.carbon_footprint ELSE 0 END), 0) AS electric_carbon_sum, " +
	                "COALESCE(SUM(CASE WHEN w.status = 'approve' THEN w.carbon_footprint ELSE 0 END), 0) AS water_carbon_sum, " +
	                "COALESCE(SUM(CASE WHEN r.status = 'approve' THEN r.carbon_footprint ELSE 0 END), 0) AS recycle_carbon_sum, " +
	                "COALESCE(SUM(electric_carbon_sum + water_carbon_sum + recycle_carbon_sum, 0) AS sum_cf " +
	                "FROM (SELECT UNNEST(ARRAY[" +
	                "'Pulai Indah', 'Kangkar Pulai', 'Pulai Utama', 'Sri Pulai', 'Taman Universiti'," +
	                "'Mutiara Rini', 'Lima Kedai', 'Nusa Bayu', 'Gelang Patah', 'Leisure Farm'," +
	                "'Tanjung Kupang', 'Medini Iskandar', 'Kota Iskandar', 'Bukit Horizon', 'Impian Emas'," +
	                "'Sri Skudai', 'Skudai', 'Skudai Baru', 'Selesa Jaya', 'Tun Aminah', 'Nusa Bestari'," +
	                "'Bukit Indah', 'Sutera Utama', 'Perling'" +
	                "]) AS area) areas " +
	                "LEFT JOIN user u ON areas.area = u.area " +
	                "LEFT JOIN electricBill e ON u.user_id = e.user_id " +
	                "LEFT JOIN waterBill w ON u.user_id = w.user_id " +
	                "LEFT JOIN recycleBill r ON u.user_id = r.user_id " +
	                "WHERE e.status = 'approve' OR w.status = 'approve' OR r.status = 'approve'" + 
	                "GROUP BY areas.area";

	        List<AreaCarbon> areaCarbonList = jdbct.query(sql, new BeanPropertyRowMapper<>(AreaCarbon.class));
	        return areaCarbonList;
	    } catch (DataAccessException e) {
	    	
	        e.printStackTrace();

	        // Return a list of AreaCarbon objects with default values if an exception occurs
	        List<AreaCarbon> defaultAreaCarbonList = generateDefaultAreaCarbonList();
	        return defaultAreaCarbonList;
	    }
	}
	
	public List<AreaCarbon> generateDefaultAreaCarbonList() {
	    // Generate a list of AreaCarbon objects with default values (all values set to 0)
	    List<String> areaNames = Arrays.asList(
	            "Pulai Indah", "Kangkar Pulai", "Pulai Utama", "Sri Pulai", "Taman Universiti",
	            "Mutiara Rini", "Lima Kedai", "Nusa Bayu", "Gelang Patah", "Leisure Farm",
	            "Tanjung Kupang", "Medini Iskandar", "Kota Iskandar", "Bukit Horizon", "Impian Emas",
	            "Sri Skudai", "Skudai", "Skudai Baru", "Selesa Jaya", "Tun Aminah", "Nusa Bestari",
	            "Bukit Indah", "Sutera Utama", "Perling"
	    );

	    List<AreaCarbon> defaultAreaCarbonList = new ArrayList<>();
	    for (String area : areaNames) {
	        AreaCarbon defaultAreaCarbon = new AreaCarbon();
	        defaultAreaCarbon.setArea(area);
	        defaultAreaCarbon.setNum_participant(0);
	        defaultAreaCarbon.setElectric_consumption(0.0);
	        defaultAreaCarbon.setWater_consumption(0.0);
	        defaultAreaCarbon.setRecycle_weight(0.0);
	        defaultAreaCarbon.setSum_cf(0.0);

	        defaultAreaCarbonList.add(defaultAreaCarbon);
	    }

	    return defaultAreaCarbonList;
	}
	
	public AreaCarbon getHighestLowestCFArea(String hl) {
		
		try {
	        String sql = "SELECT areas.area," +
	                "COUNT(u.id) AS num_participant, " +
	                "COALESCE(SUM(CASE WHEN e.status = 'approve' THEN e.electric_consumption ELSE 0 END), 0) AS electric_consumption, " +
	                "COALESCE(SUM(CASE WHEN w.status = 'approve' THEN w.water_consumption ELSE 0 END), 0) AS water_consumption, " +
	                "COALESCE(SUM(CASE WHEN r.status = 'approve' THEN r.recycle_weight ELSE 0 END), 0) AS recycle_weight, " +
	                "COALESCE(SUM(CASE WHEN e.status = 'approve' THEN e.carbon_footprint ELSE 0 END), 0) AS electric_carbon_sum, " +
	                "COALESCE(SUM(CASE WHEN w.status = 'approve' THEN w.carbon_footprint ELSE 0 END), 0) AS water_carbon_sum, " +
	                "COALESCE(SUM(CASE WHEN r.status = 'approve' THEN r.carbon_footprint ELSE 0 END), 0) AS recycle_carbon_sum, " +
	                "COALESCE(SUM(electric_carbon_sum + water_carbon_sum + recycle_carbon_sum, 0) AS sum_cf " +
	                "FROM (SELECT UNNEST(ARRAY[" +
	                "'Pulai Indah', 'Kangkar Pulai', 'Pulai Utama', 'Sri Pulai', 'Taman Universiti'," +
	                "'Mutiara Rini', 'Lima Kedai', 'Nusa Bayu', 'Gelang Patah', 'Leisure Farm'," +
	                "'Tanjung Kupang', 'Medini Iskandar', 'Kota Iskandar', 'Bukit Horizon', 'Impian Emas'," +
	                "'Sri Skudai', 'Skudai', 'Skudai Baru', 'Selesa Jaya', 'Tun Aminah', 'Nusa Bestari'," +
	                "'Bukit Indah', 'Sutera Utama', 'Perling'" +
	                "]) AS area) areas " +
	                "LEFT JOIN user u ON areas.area = u.area " +
	                "LEFT JOIN electricBill e ON u.user_id = e.user_id " +
	                "LEFT JOIN waterBill w ON u.user_id = w.user_id " +
	                "LEFT JOIN recycleBill r ON u.user_id = r.user_id " +
	                "GROUP BY areas.area" + 
	                "ORDER BY sum_cf" + hl +
	                "LIMIT 1";

	        AreaCarbon areaCarbon = jdbct.queryForObject(sql, new BeanPropertyRowMapper<>(AreaCarbon.class));
	        return areaCarbon;
	    } catch (DataAccessException e) {
	        
	        e.printStackTrace();

	        AreaCarbon defaultHLAreaCarbon = new AreaCarbon();
	        defaultHLAreaCarbon.setArea("-");
	        return defaultHLAreaCarbon;
	    }
	}
	
	public int getTotalCF() {
		try {
	        String sql = "SELECT COALESCE(SUM(COALESCE(CASE WHEN e.status = 'approve' THEN e.carbon_footprint ELSE 0 END, 0) + " +
	                     "COALESCE(CASE WHEN w.status = 'approve' THEN w.carbon_footprint ELSE 0 END, 0) + " +
	                     "COALESCE(CASE WHEN r.status = 'approve' THEN r.carbon_footprint ELSE 0 END, 0)), 0) AS sum_cf " +
	                     "FROM electricBill e " +
	                     "LEFT JOIN waterBill w ON e.user_id = w.user_id " +
	                     "LEFT JOIN recycleBill r ON e.user_id = r.user_id";
	        SqlRowSet rowSet = jdbct.queryForRowSet(sql);

	        if (rowSet.next()) {
	            return rowSet.getInt("sum_cf");
	        } else {
	            return 0;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0;
	    }
	}
	
	public int getTotalParticipant() {
		try {
	        String sql = "SELECT COUNT(DISTINCT user_id) AS total_participant " +
	        		"FROM ( SELECT user_id FROM electricBill WHERE status = 'approve' " +
	        			    "UNION " +
	        			    "SELECT user_id FROM waterBill WHERE status = 'approve' " +
	        			    "UNION " +
	        			    "SELECT user_id FROM recycleBill WHERE status = 'approve' " +
	        			    ") AS combined_data";
	        SqlRowSet rowSet = jdbct.queryForRowSet(sql);

	        if (rowSet.next()) {
	            return rowSet.getInt("total_participant");
	        } else {
	            return 0;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0;
	    }
	}
}