package vn.com.fpt.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.com.fpt.bean.Categories;
import vn.com.fpt.exception.DAOException;

public class CategoryDAO {
	private Connection connection = null;
	private CallableStatement callableStatement = null;
	private ResultSet resultSet = null;
	/**
	 * Get Category By Id
	 * @param id
	 * @return
	 * @throws DAOException
	 */
	public Categories getCategoryById(int id) throws DAOException {
		try {
			connection = BaseDAO.getConnection();
			String sql = "{call selectCategoryById(?)}"; // Call store procedure to add new admin account
			callableStatement = connection.prepareCall(sql);
			callableStatement.setInt(1, id);
			resultSet = callableStatement.executeQuery();
			Categories cate = new Categories();
			while(resultSet.next()){
				cate.setCategoryId(resultSet.getInt("CategoryId"));
				cate.setCategoryAlias(resultSet.getString("CategoryAlias"));
				cate.setCategoryName(resultSet.getString("CategoryName"));
				cate.setCategoryParent(resultSet.getInt("CategoryParent"));
				cate.setDescription(resultSet.getString("Description"));
				cate.setHomePublish(resultSet.getString("HomePublic"));
				cate.setPosition(resultSet.getInt("Possition"));
			} 
			return cate;
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
	 * Get Category By Alias
	 * @param alias
	 * @return
	 * @throws DAOException
	 */
	public Categories getCategoryByAlias(String alias) throws DAOException {
		try {
			connection = BaseDAO.getConnection();
			String sql = "{call selectCategoryByAlias(?)}"; // Call store procedure to add new admin account
			callableStatement = connection.prepareCall(sql);
			callableStatement.setString(1, alias);
			resultSet = callableStatement.executeQuery();
			Categories cate = new Categories();
			while(resultSet.next()){
				cate.setCategoryId(resultSet.getInt("CategoryId"));
				cate.setCategoryAlias(resultSet.getString("CategoryAlias"));
				cate.setCategoryName(resultSet.getString("CategoryName"));
				cate.setCategoryParent(resultSet.getInt("CategoryParent"));
				cate.setDescription(resultSet.getString("Description"));
				cate.setHomePublish(resultSet.getString("HomePublic"));
				cate.setPosition(resultSet.getInt("Possition"));
			} 
			return cate;
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
	 * Get All Categories
	 * @return
	 * @throws DAOException
	 */
	public ArrayList<Categories> getAllCategories() throws DAOException {
		ArrayList<Categories> listCate = new ArrayList<Categories>();
		try {
			connection = BaseDAO.getConnection();
			String sql = "{call selectAllCategory}"; // Call store procedure to add new admin account
			callableStatement = connection.prepareCall(sql);
			resultSet = callableStatement.executeQuery();
			
			while(resultSet.next()){
				Categories cate = new Categories();
				cate.setCategoryId(resultSet.getInt("CategoryId"));
				cate.setCategoryAlias(resultSet.getString("CategoryAlias"));
				cate.setCategoryName(resultSet.getString("CategoryName"));
				cate.setCategoryParent(resultSet.getInt("CategoryParent"));
				cate.setDescription(resultSet.getString("Description"));
				cate.setHomePublish(resultSet.getString("HomePublic"));
				cate.setPosition(resultSet.getInt("Possition"));
				listCate.add(cate);
			} 
			return listCate;
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
	 * Delete category
	 * @param id
	 * @throws DAOException
	 */
	public boolean deleteCategory(int id) throws DAOException {
		try {
			connection = BaseDAO.getConnection();
			String sql = "{call deleteCategoryById}"; // Call store procedure to add new admin account
			callableStatement = connection.prepareCall(sql);
			return callableStatement.execute();
		} catch (SQLException e) {
			throw new DAOException(e.getMessage());
		} catch (DAOException e) {
			throw new DAOException(e.getMessage());
		} finally {
			try {
				if (callableStatement != null)	callableStatement.close();
				if (connection != null)	connection.close();
			} catch (SQLException e) {
				throw new DAOException(e.getMessage());
			}
		}
		
	}
	/**
	 * Update category
	 * @param cate
	 * @return
	 * @throws DAOException 
	 */
	public boolean updateCategory(Categories cate) throws DAOException {
		try {
			connection = BaseDAO.getConnection();
			String sql = "{call updateCategory(?,?,?,?,?,?,?)}"; // Call store procedure to add new admin account
			callableStatement = connection.prepareCall(sql);
			
			callableStatement.setInt(1, cate.getCategoryId());
			callableStatement.setString(2,cate.getCategoryName());
			callableStatement.setString(3,cate.getDescription());
			callableStatement.setInt(4, cate.getCategoryParent());
			callableStatement.setString(5,cate.getCategoryAlias());
			callableStatement.setString(6,cate.getHomePublish());
			callableStatement.setInt(7, cate.getPosition());
			
			return callableStatement.execute();
		} catch (SQLException e) {
			throw new DAOException(e.getMessage());
		} catch (DAOException e) {
			throw new DAOException(e.getMessage());
		} finally {
			try {
				if (callableStatement != null)	callableStatement.close();
				if (connection != null)	connection.close();
			} catch (SQLException e) {
				throw new DAOException(e.getMessage());
			}
		}
		
	}
	/**
	 * Insert Category
	 * @param cate
	 * @return
	 * @throws DAOException
	 */
	public boolean insertCategory(Categories cate) throws DAOException {
		try {
			connection = BaseDAO.getConnection();
			String sql = "{call insertCategory(?,?,?,?,?,?)}"; // Call store procedure to add new admin account
			callableStatement = connection.prepareCall(sql);
			
			callableStatement.setString(1,cate.getCategoryName());
			callableStatement.setString(2,cate.getDescription());
			callableStatement.setInt(3, cate.getCategoryParent());
			callableStatement.setString(4,cate.getCategoryAlias());
			callableStatement.setString(5,cate.getHomePublish());
			callableStatement.setInt(6, cate.getPosition());
			
			return callableStatement.execute();
		} catch (SQLException e) {
			throw new DAOException(e.getMessage());
		} catch (DAOException e) {
			throw new DAOException(e.getMessage());
		} finally {
			try {
				if (callableStatement != null)	callableStatement.close();
				if (connection != null)	connection.close();
			} catch (SQLException e) {
				throw new DAOException(e.getMessage());
			}
		}
		
	}

}
