package com.techelevator.DAO;

public interface UserDAO {

	public void saveUser(String userName, String password, String userType);

	public boolean searchForUsernameAndPassword(String userName, String password);

//	public String searchForUserType(String userName, String password);

	public String login(String username, String password);

}
