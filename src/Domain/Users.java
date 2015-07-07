package Domain;

public class Users {
	
	int id;
	public String username;
	String password;
	String email;
	int bookscount;
	
	public Users(int id, String username, String password, String email) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
	}
	
	public Users(String username, String password, String email) {

		this.username = username;
		this.password = password;
		this.email = email;
	}
	
	
	public Users(int id, String username, String password, String email, int bookscount) {
		super();
		this.id = id;
		this.username = username;
		this.password  = password;
		this.email = email;
		this.bookscount = bookscount;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getBookscount() {
		return bookscount;
	}

	public void setBookscount(int bookscount) {
		this.bookscount = bookscount;
	}

	@Override
	public String toString() {
		return "Users [id=" + id + ", username=" + username + ", password="
				+ password + ", email=" + email + ", bookscount=" + bookscount
				+ "]";
	}

	//implements the comparable interface
	public int compareTo(Users o) {
		
		return this.getUsername().compareTo(o.getUsername());
		
	}
	
	// print the username in Capitalized
	public String getCapitalizedUsername()
	{
		String nameString = this.username.toLowerCase();
		nameString = Character.toString(nameString.charAt(0)).toUpperCase() + nameString.substring(1);
		
		return nameString;
	}
	

}
