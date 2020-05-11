public class BookDTO {
	private int num;
	private String title, company, name;
	private int cost;
	
	public BookDTO() {}

	public BookDTO(int num, String title, String company, String name, int cost) {
		super();
		this.num = num;
		this.title = title;
		this.company = company;
		this.name = name;
		this.cost = cost;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}
	
	
} // class