package Managers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import Domain.Books;
import Domain.Category;

public class CategoryManager {

	DataSource ds;

	public CategoryManager(DataSource ds) {
		this.ds = ds;
	}

	public ArrayList<Category> getCategory(int theUserID) throws SQLException {
		ArrayList<Category> theCategory = new ArrayList<Category>();
		Connection connection = null;

		try {

			connection = ds.getConnection();
			PreparedStatement ps = connection.prepareStatement("select * from category where user_id=?");
			ps.setInt(1, theUserID);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {

				theCategory.add( new Category(resultSet.getInt("id"),
												resultSet.getInt("user_id"),
												resultSet.getString("name")) );
			}

			resultSet.close();
			ps.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(connection != null) {
				try {
					connection.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		}

		return theCategory;
	}

	public Category getCategoryByID(int id, int theUserID) throws SQLException {
		
		Category categoryByID = null;
		Connection connection = ds.getConnection();
		
		try {
			PreparedStatement ps = connection.prepareStatement("select id, user_id, name from category where id=? and user_id=?");
			ps.setInt(1, id);
			ps.setInt(2, theUserID);
			
			ResultSet resultSet = ps.executeQuery();
			while(resultSet.next()) {
				categoryByID = new Category(resultSet.getInt("id"),
												resultSet.getInt("user_id"),
												resultSet.getString("name"));
					
			}
			resultSet.close();
			ps.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(connection != null) {
				try {
					connection.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		} 
		
		return categoryByID;
		
	}
	
	
	public List<Category> getCategoryTotals(int theUserID) throws SQLException
	{
		List<Category> bookCounts = new ArrayList<>();
		
		Connection connection = null;
		try {
			connection = ds.getConnection();
			PreparedStatement ps = connection.prepareStatement("select category.id, category.name, count(books.id) as bookcounts from category left outer join books on category.id = books.category_id where category.user_id = ? group by category.id, category.name");
			ps.setInt(1, theUserID);
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next()) {
				int idString = resultSet.getInt("id");
				String categoryNameString = resultSet.getString("name");
				int  bookcountsString = resultSet.getInt("bookcounts");
				
				bookCounts.add(new Category(idString,categoryNameString,bookcountsString));
				
			}
			
			resultSet.close();
			ps.close();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(connection != null) {
				try {
					connection.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		}
		
		return bookCounts;
		
	}

	public boolean addCategory(int theUserID,String name) throws SQLException
	{
		boolean addedCategory = false;
		Connection connection = null;
		
		try { 
			connection = ds.getConnection();
			String theQueryString = "INSERT INTO CATEGORY (USER_ID, NAME) values (?,?)";
			PreparedStatement ps = connection.prepareStatement(theQueryString);
			ps.setInt(1, theUserID);
			ps.setString(2, name);
			
			int updatedCount = ps.executeUpdate();
			if(updatedCount >= 1) {
				addedCategory = true;
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(connection != null) {
				try {
					connection.close();
					
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return addedCategory;
		
	}
	
	// edit and update category in database
	public boolean updateCategory(Category c) throws SQLException {
		
		boolean updatedCategory = false;
		Connection connection = null;
		
		try {
			connection = ds.getConnection();
			PreparedStatement ps = connection.prepareStatement("update category set name=? where id=?");
			ps.setString(1, c.getName());
			ps.setInt(2, c.getId());
			
			ps.executeUpdate();
			updatedCategory = true;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(connection != null) {
				try {
					connection.close();
				} catch (SQLException e){
					e.printStackTrace();
				}
			}
		}
		return updatedCategory;
		
	}
	
	// delete category with ID from the database
	public boolean deleteCategoryWithID(int id) throws SQLException {
		
		boolean deletedCategory = false;
		Connection connection = null;
		
		try { 
			connection = ds.getConnection();
			String theQueryString = "delete from category where id =?";
			
			PreparedStatement ps = connection.prepareStatement(theQueryString);
			ps.setInt(1, id);
			
			int updatedCount = ps.executeUpdate();
			if (updatedCount >= 1) {
				deletedCategory = true;
				
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return deletedCategory;
		
	}
	
}
