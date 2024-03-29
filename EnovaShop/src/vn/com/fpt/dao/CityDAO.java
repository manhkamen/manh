package vn.com.fpt.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.com.fpt.bean.City;
import vn.com.fpt.exception.DAOException;

public class CityDAO {
	private Connection connection = null;
	private CallableStatement callableStatement = null;
	private ResultSet resultSet = null;
	/**
	 * Get City by ID
	 * @param id
	 * @return
	 * @throws DAOException 
	 */
	public City getCityById(int id) throws DAOException {
		// TODO Auto-generated method stub
		
		try {
			connection = BaseDAO.getConnection();
			String sql = "{call selectCityById(?)}"; // Call store procedure to add new admin account
			callableStatement = connection.prepareCall(sql);
			callableStatement.setInt(1, id);
			resultSet = callableStatement.executeQuery();
			City city = new City();
			while(resultSet.next()){
				city.setCityId(id);
				city.setCity(resultSet.getString("City"));
				city.setFeeDelivery(resultSet.getDouble("FeeDelivery"));
			} 
			return city;
		} catch (SQLException e) {
			throw new DAOException(e.getMessage());
		} catch (DAOException e) {
			throw new DAOException(e.getMessage());
		} finally {
			try {
				if (resultSet!=null) resultSet.close();
				if (callableStatement != null)	callableStatement.close();
				if (connection != null)	connection.close();
			} catch (SQLException e) {
				throw new DAOException(e.getMessage());
			}
		}
	}
	/**
	 * Get All City
	 * @return
	 * @throws DAOException
	 */
	public ArrayList<City> getAllCity() throws DAOException {
		// TODO Auto-generated method stub
		ArrayList<City> listCity = new ArrayList<City>();
		try {
			connection = BaseDAO.getConnection();
			String sql = "{call selectCityById(?)}"; // Call store procedure to add new admin account
			callableStatement = connection.prepareCall(sql);
			resultSet = callableStatement.executeQuery();
			
			while(resultSet.next()){
				City city = new City();
				city.setCityId(resultSet.getInt("CityId"));
				city.setCity(resultSet.getString("City"));
				city.setFeeDelivery(resultSet.getDouble("FeeDelivery"));
				listCity.add(city);
			} 
			return listCity;
		} catch (SQLException e) {
			throw new DAOException(e.getMessage());
		} catch (DAOException e) {
			throw new DAOException(e.getMessage());
		} finally {
			try {
				if (resultSet!=null) resultSet.close();
				if (callableStatement != null)	callableStatement.close();
				if (connection != null)	connection.close();
			} catch (SQLException e) {
				throw new DAOException(e.getMessage());
			}
		}
	}
	
	/**
	 * Delete categories
	 * @param id
	 * @return
	 * @throws DAOException
	 */
	public boolean deleteCityById(int id) throws DAOException {
		// TODO Auto-generated method stub
		try {
			connection = BaseDAO.getConnection();
			String sql = "{call deleteCity(?)}"; // Call store procedure to add new admin account
			callableStatement = connection.prepareCall(sql);
			callableStatement.setInt(1, id); 
			return callableStatement.execute();
			
		} catch (SQLException e) {
			throw new DAOException(e.getMessage());
		} catch (DAOException e) {
			throw new DAOException(e.getMessage());
		} finally {
			try {
				if (resultSet!=null) resultSet.close();
				if (callableStatement != null)	callableStatement.close();
				if (connection != null)	connection.close();
			} catch (SQLException e) {
				throw new DAOException(e.getMessage());
			}
		}
	}
	/**
	 * Insert City
	 * @param city
	 * @return
	 * @throws DAOException
	 */
	public boolean insertCity(City city) throws DAOException {
		try {
			connection = BaseDAO.getConnection();
			String sql = "{call insertCity(?,?)}"; // Call store procedure to add new admin account
			callableStatement = connection.prepareCall(sql);
			callableStatement.setString(1,city.getCity());
			callableStatement.setDouble(2, city.getFeeDelivery());
			
			return callableStatement.execute();
			
		} catch (SQLException e) {
			throw new DAOException(e.getMessage());
		} catch (DAOException e) {
			throw new DAOException(e.getMessage());
		} finally {
			try {
				if (resultSet!=null) resultSet.close();
				if (callableStatement != null)	callableStatement.close();
				if (connection != null)	connection.close();
			} catch (SQLException e) {
				throw new DAOException(e.getMessage());
			}
		}
	}
	/**
	 * Update City
	 * @param city
	 * @return
	 * @throws DAOException
	 */
	public boolean updateCity(City city) throws DAOException {
		try {
			connection = BaseDAO.getConnection();
			String sql = "{call updateCity(?,?,?)}"; // Call store procedure to add new admin account
			callableStatement = connection.prepareCall(sql);
			callableStatement.setInt(1, city.getCityId());
			callableStatement.setString(2,city.getCity());
			callableStatement.setDouble(3, city.getFeeDelivery());
			
			return callableStatement.execute();
			
		} catch (SQLException e) {
			throw new DAOException(e.getMessage());
		} catch (DAOException e) {
			throw new DAOException(e.getMessage());
		} finally {
			try {
				if (resultSet!=null) resultSet.close();
				if (callableStatement != null)	callableStatement.close();
				if (connection != null)	connection.close();
			} catch (SQLException e) {
				throw new DAOException(e.getMessage());
			}
		}
	}
}
