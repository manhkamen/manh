package vn.com.fpt.bo;

import java.util.ArrayList;

import vn.com.fpt.bean.City;
import vn.com.fpt.dao.CityDAO;
import vn.com.fpt.exception.DAOException;

public class CityBO {
	private CityDAO cityDAO = new CityDAO();
	/**
	 * Get City by ID
	 * @param id
	 * @return
	 * @throws DAOException
	 */
	public City getCityById(int id) throws DAOException {
		return cityDAO.getCityById(id);
	}
	/**
	 * Get All City
	 * @return
	 * @throws DAOException
	 */
	public ArrayList<City> getAllCity() throws DAOException {
		return cityDAO.getAllCity();
	}
	/**
	 * Delete categories
	 * @param id
	 * @return
	 * @throws DAOException
	 */
	public boolean deleteCityById(int id) throws DAOException {
		return cityDAO.deleteCityById(id);
	}
	/**
	 * Insert City
	 * @param city
	 * @return
	 * @throws DAOException
	 */
	public boolean insertCity(City city) throws DAOException {
		return cityDAO.insertCity(city);
	}
	
}
