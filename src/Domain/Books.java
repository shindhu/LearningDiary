package Domain;

public class Books {
	
	int id;
	int user_id;
	int category_id;
	String image;
	String name;
	String book_format;
	String notes;
	
	public Books(int id, int user_id, int category_id, String image,
			String name, String book_format, String notes) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.category_id = category_id;
		this.image = image;
		this.name = name;
		this.book_format = book_format;
		this.notes = notes;
	}

	public Books(int id,  String image, String name,
			String book_format, String notes) {
		
		this.id = id;
		this.image = image;
		this.name = name;
		this.book_format = book_format;
		this.notes = notes;
		
	}
	
	public Books(int id, int category_id, String image, String name, String book_format, String notes) {
		this.id = id;
		this.category_id = category_id;
		this.image = image;
		this.name = name;
		this.book_format = book_format;
		this.notes = notes;
		
	}
	
	public Books() {
		
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

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBook_format() {
		return book_format;
	}

	public void setBook_format(String book_format) {
		this.book_format = book_format;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getLowerName()
	{
		String theName = this.name.toLowerCase();
		return theName;
		
	}
	
	public String getLowerNotes()
	{
		String theNotes = this.notes.toLowerCase();
		return theNotes;
		
	}

	@Override
	public String toString() {
		return "Books [id=" + id + ", user_id=" + user_id + ", category_id="
				+ category_id + ", image=" + image + ", name=" + name
				+ ", book_format=" + book_format + ", notes=" + notes + "]";
	}

	
	
}
