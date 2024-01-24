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
import com.model.MonthlyCarbonFootprint;

public class AreaCarbonDAO {
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
	
	public List<AreaCarbon> getAreaCarbonData(int year) {
		try {
	        String sql = "SELECT\r\n" + 
	        		"    u.area,\r\n" + 
	        		"    COUNT(DISTINCT u.id) AS num_participant,\r\n" + 
	        		"    COALESCE(SUM(electric_consumption), 0) AS electric_consumption,\r\n" + 
	        		"    COALESCE(SUM(water_consumption), 0) AS water_consumption,\r\n" + 
	        		"    COALESCE(SUM(recycle_weight), 0) AS recycle_weight,\r\n" + 
	        		"    COALESCE(COALESCE(SUM(electric_footprint), 0) + COALESCE(SUM(water_footprint), 0) + COALESCE(SUM(recycle_footprint), 0), 0) AS sum_cf\r\n" + 
	        		"FROM (\r\n" + 
	        		"    SELECT\r\n" + 
	        		"        user_id,\r\n" + 
	        		"        year,\r\n" + 
	        		"        month,\r\n" + 
	        		"    	electric_consumption,\r\n" + 
	        		"    	NULL AS water_consumption,\r\n" + 
	        		"        NULL AS recycle_weight,\r\n" + 
	        		"        carbon_footprint AS electric_footprint,\r\n" + 
	        		"        NULL AS water_footprint,\r\n" + 
	        		"        NULL AS recycle_footprint\r\n" + 
	        		"    FROM ElectricBill\r\n" + 
	        		"    WHERE status = 'approve'\r\n" + 
	        		"    UNION ALL\r\n" + 
	        		"    SELECT\r\n" + 
	        		"        user_id,\r\n" + 
	        		"        year,\r\n" + 
	        		"        month,\r\n" + 
	        		"    	NULL AS electric_consumption,\r\n" + 
	        		"    	water_consumption,\r\n" + 
	        		"    	NULL AS recycle_weight,\r\n" + 
	        		"        NULL AS electric_footprint,\r\n" + 
	        		"        carbon_footprint AS water_footprint,\r\n" + 
	        		"        NULL AS recycle_footprint\r\n" + 
	        		"    FROM WaterBill\r\n" + 
	        		"    WHERE status = 'approve'\r\n" + 
	        		"    UNION ALL\r\n" + 
	        		"    SELECT\r\n" + 
	        		"        user_id,\r\n" + 
	        		"        year,\r\n" + 
	        		"        month,\r\n" + 
	        		"    	NULL AS electric_consumption,\r\n" + 
	        		"   		NULL AS water_consumption,\r\n" + 
	        		"    	recycle_weight,\r\n" + 
	        		"        NULL AS electric_footprint,\r\n" + 
	        		"        NULL AS water_footprint,\r\n" + 
	        		"        carbon_footprint AS recycle_footprint\r\n" + 
	        		"    FROM RecycleBill\r\n" + 
	        		"    WHERE status = 'approve'\r\n" + 
	        		") AS bills \r\n" + 
	        		"join user u on u.id = user_id\r\n" + 
	        		"WHERE year = " + year +
	        		" GROUP BY u.area\r\n";

	        List<AreaCarbon> areaCarbonList = jdbct.query(sql, new BeanPropertyRowMapper<>(AreaCarbon.class));
	        return areaCarbonList;
	    } catch (DataAccessException e) {
	    	
	        e.printStackTrace();

	        return Collections.emptyList();
	    }
	}

	
	public AreaCarbon getHighestLowestCFArea(String hl, int year) {
		
		try {
	        String sql = "SELECT\r\n" + 
	        		"    u.area,\r\n" + 
	        		"    COUNT(DISTINCT u.id) AS total_participants,\r\n" + 
	        		"    COALESCE(SUM(electric_consumption),\r\n" + 
	        		"    0) AS electric_consumption,\r\n" + 
	        		"    COALESCE(SUM(water_consumption),\r\n" + 
	        		"    0) AS water_consumption,\r\n" + 
	        		"    COALESCE(SUM(recycle_weight),\r\n" + 
	        		"    0) AS recycle_weight,\r\n" + 
	        		"    COALESCE(\r\n" + 
	        		"        COALESCE(SUM(electric_footprint),\r\n" + 
	        		"        0) + COALESCE(SUM(water_footprint),\r\n" + 
	        		"        0) + COALESCE(SUM(recycle_footprint),\r\n" + 
	        		"        0),\r\n" + 
	        		"        0\r\n" + 
	        		"    ) AS sum_cf\r\n" + 
	        		"FROM\r\n" + 
	        		"    (\r\n" + 
	        		"    SELECT\r\n" + 
	        		"        user_id,\r\n" + 
	        		"        YEAR,\r\n" + 
	        		"        month,\r\n" + 
	        		"        electric_consumption,\r\n" + 
	        		"        NULL AS water_consumption,\r\n" + 
	        		"        NULL AS recycle_weight,\r\n" + 
	        		"        carbon_footprint AS electric_footprint,\r\n" + 
	        		"        NULL AS water_footprint,\r\n" + 
	        		"        NULL AS recycle_footprint\r\n" + 
	        		"    FROM\r\n" + 
	        		"        ElectricBill\r\n" + 
	        		"    WHERE\r\n" + 
	        		"STATUS\r\n" + 
	        		"    = 'approve'\r\n" + 
	        		"UNION ALL\r\n" + 
	        		"SELECT\r\n" + 
	        		"    user_id,\r\n" + 
	        		"    YEAR,\r\n" + 
	        		"    month,\r\n" + 
	        		"    NULL AS electric_consumption,\r\n" + 
	        		"    water_consumption,\r\n" + 
	        		"    NULL AS recycle_weight,\r\n" + 
	        		"    NULL AS electric_footprint,\r\n" + 
	        		"    carbon_footprint AS water_footprint,\r\n" + 
	        		"    NULL AS recycle_footprint\r\n" + 
	        		"FROM\r\n" + 
	        		"    WaterBill\r\n" + 
	        		"WHERE\r\n" + 
	        		"STATUS\r\n" + 
	        		"    = 'approve'\r\n" + 
	        		"UNION ALL\r\n" + 
	        		"SELECT\r\n" + 
	        		"    user_id,\r\n" + 
	        		"    YEAR,\r\n" + 
	        		"    month,\r\n" + 
	        		"    NULL AS electric_consumption,\r\n" + 
	        		"    NULL AS water_consumption,\r\n" + 
	        		"    recycle_weight,\r\n" + 
	        		"    NULL AS electric_footprint,\r\n" + 
	        		"    NULL AS water_footprint,\r\n" + 
	        		"    carbon_footprint AS recycle_footprint\r\n" + 
	        		"FROM\r\n" + 
	        		"    RecycleBill\r\n" + 
	        		"WHERE\r\n" + 
	        		"STATUS\r\n" + 
	        		"    = 'approve'\r\n" + 
	        		") AS bills\r\n" + 
	        		"JOIN USER u ON\r\n" + 
	        		"    u.id = user_id\r\n" + 
	        		"WHERE\r\n" + 
	        		"    YEAR = " + year +
	        		" GROUP BY\r\n" + 
	        		"    u.area\r\n" + 
	        		"ORDER BY\r\n" + 
	        		"    sum_cf " +  hl + 
	        		" LIMIT 1";

	        AreaCarbon areaCarbon = jdbct.queryForObject(sql, new BeanPropertyRowMapper<>(AreaCarbon.class));
	        return areaCarbon;
	    } catch (DataAccessException e) {
	        
	        e.printStackTrace();

	        AreaCarbon defaultHLAreaCarbon = new AreaCarbon();
	        defaultHLAreaCarbon.setArea("-");
	        return defaultHLAreaCarbon;
	    }
	}
	
	public double getTotalCFByYear(int year) {
		try {
			String sql = "SELECT ROUND(COALESCE(COALESCE(SUM(electric_footprint), 0) + COALESCE(SUM(water_footprint), 0) + COALESCE(SUM(recycle_footprint), 0), 0), 2) AS sum_cf " + 
		             "FROM (" + 
		             "    SELECT user_id, year, month, carbon_footprint AS electric_footprint, NULL AS water_footprint, NULL AS recycle_footprint FROM ElectricBill WHERE status = 'approve' " + 
		             "    UNION ALL " + 
		             "    SELECT user_id, year, month, NULL AS electric_footprint, carbon_footprint AS water_footprint, NULL AS recycle_footprint FROM WaterBill WHERE status = 'approve' " + 
		             "    UNION ALL " + 
		             "    SELECT user_id, year, month, NULL AS electric_footprint, NULL AS water_footprint, carbon_footprint AS recycle_footprint FROM RecycleBill WHERE status = 'approve' " + 
		             ") AS combined_data where year = "+ year;
	        SqlRowSet rowSet = jdbct.queryForRowSet(sql);

	        if (rowSet.next()) {
	            return rowSet.getDouble("sum_cf");
	        } else {
	            return 0;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0;
	    }
	}
	
	public int getTotalParticipant(int year) {
		try {
	        String sql = "SELECT COUNT(DISTINCT user_id) AS total_participant " +
	        				"FROM ( SELECT user_id FROM electricBill WHERE status = 'approve' AND year <= " + year +
	        			    " UNION " +
	        			    "SELECT user_id FROM waterBill WHERE status = 'approve' AND year <= " + year +
	        			    " UNION " +
	        			    "SELECT user_id FROM recycleBill WHERE status = 'approve' AND year <= " + year +
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
	
	public List<MonthlyCarbonFootprint> getMonthlyTotalCFByYear(int year) {
		try {
			String sql = "SELECT month, COALESCE(COALESCE(SUM(electric_footprint), 0) + COALESCE(SUM(water_footprint), 0) + COALESCE(SUM(recycle_footprint), 0), 0) AS month_totalCF " + 
		             "FROM (" + 
		             "    SELECT user_id, year, month, carbon_footprint AS electric_footprint, NULL AS water_footprint, NULL AS recycle_footprint FROM ElectricBill WHERE status = 'approve' " + 
		             "    UNION ALL " + 
		             "    SELECT user_id, year, month, NULL AS electric_footprint, carbon_footprint AS water_footprint, NULL AS recycle_footprint FROM WaterBill WHERE status = 'approve' " + 
		             "    UNION ALL " + 
		             "    SELECT user_id, year, month, NULL AS electric_footprint, NULL AS water_footprint, carbon_footprint AS recycle_footprint FROM RecycleBill WHERE status = 'approve' " + 
		             ") AS combined_data " + 
		             "WHERE year = " + year +
		             " GROUP BY month " + 
		             "ORDER BY month"; 
			
			List<MonthlyCarbonFootprint> mcf = jdbct.query(sql, new BeanPropertyRowMapper<MonthlyCarbonFootprint>(MonthlyCarbonFootprint.class));
			return mcf;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        return Collections.emptyList();
	    }
	}
	
	public double carbonFootprintByCategory(String category, int year) {
		try {
			String sql = "SELECT\r\n" + 
					"    u.category,\r\n" + 
					"    COALESCE(\r\n" + 
					"        COALESCE(SUM(electric_footprint),\r\n" + 
					"        0) + COALESCE(SUM(water_footprint),\r\n" + 
					"        0) + COALESCE(SUM(recycle_footprint),\r\n" + 
					"        0),\r\n" + 
					"        0\r\n" + 
					"    ) AS sum_cf\r\n" + 
					"FROM\r\n" + 
					"    (\r\n" + 
					"    SELECT\r\n" + 
					"        user_id,\r\n" + 
					"        YEAR,\r\n" + 
					"        month,\r\n" + 
					"        electric_consumption,\r\n" + 
					"        NULL AS water_consumption,\r\n" + 
					"        NULL AS recycle_weight,\r\n" + 
					"        carbon_footprint AS electric_footprint,\r\n" + 
					"        NULL AS water_footprint,\r\n" + 
					"        NULL AS recycle_footprint\r\n" + 
					"    FROM\r\n" + 
					"        ElectricBill\r\n" + 
					"    WHERE\r\n" + 
					"STATUS\r\n" + 
					"    = 'approve'\r\n" + 
					"UNION ALL\r\n" + 
					"SELECT\r\n" + 
					"    user_id,\r\n" + 
					"    YEAR,\r\n" + 
					"    month,\r\n" + 
					"    NULL AS electric_consumption,\r\n" + 
					"    water_consumption,\r\n" + 
					"    NULL AS recycle_weight,\r\n" + 
					"    NULL AS electric_footprint,\r\n" + 
					"    carbon_footprint AS water_footprint,\r\n" + 
					"    NULL AS recycle_footprint\r\n" + 
					"FROM\r\n" + 
					"    WaterBill\r\n" + 
					"WHERE\r\n" + 
					"STATUS\r\n" + 
					"    = 'approve'\r\n" + 
					"UNION ALL\r\n" + 
					"SELECT\r\n" + 
					"    user_id,\r\n" + 
					"    YEAR,\r\n" + 
					"    month,\r\n" + 
					"    NULL AS electric_consumption,\r\n" + 
					"    NULL AS water_consumption,\r\n" + 
					"    recycle_weight,\r\n" + 
					"    NULL AS electric_footprint,\r\n" + 
					"    NULL AS water_footprint,\r\n" + 
					"    carbon_footprint AS recycle_footprint\r\n" + 
					"FROM\r\n" + 
					"    RecycleBill\r\n" + 
					"WHERE\r\n" + 
					"STATUS\r\n" + 
					"    = 'approve'\r\n" + 
					") AS bills\r\n" + 
					"JOIN USER u ON\r\n" + 
					"    u.id = user_id\r\n" + 
					"WHERE\r\n" + 
					"    YEAR = " + year +
					" AND u.category = '" + category + "'";
			
			SqlRowSet rowSet = jdbct.queryForRowSet(sql);

	        if (rowSet.next()) {
	            return rowSet.getDouble("sum_cf");
	        } else {
	            return 0;
	        }
	        
	    } catch (Exception e) {
	    	e.printStackTrace();
	    	return 0;
	    }
	}
	
}