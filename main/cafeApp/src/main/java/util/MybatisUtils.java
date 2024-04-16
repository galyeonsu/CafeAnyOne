package util;

import javax.sql.DataSource;

import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import lombok.extern.log4j.Log4j;

public class MybatisUtils { 
	static {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	private static TransactionFactory transactionFactory() {
		return new JdbcTransactionFactory();
	}
	
	public static DataSource dataSource() {
		HikariConfig config = new HikariConfig();
		config.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		config.setJdbcUrl("jdbc:log4jdbc:mariadb://jykjy.co.kr:3306/semi_test");
		config.setUsername("test");
		config.setPassword("1234");
		
		config.setMinimumIdle(3);
		config.setMaximumPoolSize(3);
		config.setConnectionTimeout(3000);
		config.setValidationTimeout(3000);
		config.setMaxLifetime(30000);
		
		HikariDataSource dataSource = new HikariDataSource(config);
		return dataSource;
	}
	
	public static SqlSessionFactory sqlSessionFactory() {
		Environment environment = new Environment("dev", transactionFactory(), dataSource());
		Configuration config = new Configuration(environment);
		config.addMappers("kr.co.jykjy.mapper");
		
		return new SqlSessionFactoryBuilder().build(config);
	}
}
