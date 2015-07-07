package Domain;

public class Category {
	
	int id;
	int user_id;
	String name;
	int bookcounts;
	
	public Category(int id, int user_id, String name, int bookcounts) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.name = name;
		this.bookcounts = bookcounts;
	}

	public Category(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public Category(int id, String name, int bookcounts) {
		this.id = id;
		this.name = name;
		this.bookcounts = bookcounts;
	}

	public Category(int id, int user_id, String name) {
		this.id = id;
		this.user_id = user_id;
		this.name = name;
	}

	public Category(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getBookcounts() {
		return bookcounts;
	}

	public void setBookcounts(int bookcounts) {
		this.bookcounts = bookcounts;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", user_id=" + user_id + ", name=" + name
				+ ", bookcounts=" + bookcounts + "]";
	}
	
	
}
