package vn.com.fpt.bo;

import java.util.ArrayList;

import vn.com.fpt.bean.Categories;
import vn.com.fpt.dao.CategoryDAO;
import vn.com.fpt.exception.DAOException;

public class CategoryBO {
	private CategoryDAO categoryDAO = new CategoryDAO();
	/**
	 * Get Category By Id
	 * @param id
	 * @return
	 * @throws DAOException
	 */
	public Categories getCategoryById(int id) throws DAOException{
		return categoryDAO.getCategoryById(id);
	}
	
	/**
	 * Get Category By Alias
	 * @param alias
	 * @return
	 * @throws DAOException
	 */
	public Categories getCategoryByAlias(String alias) throws DAOException {
		return categoryDAO.getCategoryByAlias(alias);
	}
	/**
	 * Get All Category
	 * @return
	 * @throws DAOException
	 */
	public ArrayList<Categories> getAllCategories() throws DAOException{
		return categoryDAO.getAllCategories();
	}
	/**
	 * Delete category
	 * @param id
	 * @throws DAOException
	 */
	public boolean deleteCategory(int id) throws DAOException{
		return categoryDAO.deleteCategory(id);
	}
	
	public boolean updateCategory(Categories cate) throws DAOException{
		return categoryDAO.updateCategory(cate);
	}
	/**
	 * Insert Category
	 * @param cate
	 * @return
	 * @throws DAOException
	 */
	public boolean insertCategory(Categories cate) throws DAOException
	{
		return categoryDAO.insertCategory(cate);
	}
	
}
