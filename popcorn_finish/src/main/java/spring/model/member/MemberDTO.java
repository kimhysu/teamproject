package spring.model.member;

import java.util.Arrays;
import java.util.List;

import spring.model.movie.MovieDTO;

public class MemberDTO {

	private String authkey;
	private int authstatus; 
	private String id;
	private String email;
	private String genre[];
	private String genre_str;
	private String grade;
	private String pw;
	private int age;
	private String name;
	private String gender;
	
	private List<MovieDTO> movies;
	
	public List<MovieDTO> getMovies() {
		return movies;
	}

	public void setMovies(List<MovieDTO> movies) {
		this.movies = movies;
	}

	public String getGenre_str() {
			if(genre!=null) {
			
			String genre_str = "";
			   for(int i=0;i<genre.length;i++) {
				   genre_str += genre[i];
				   if(i<genre.length-1) {
					   genre_str += ",";
				   }
			   }
			   this.genre_str = genre_str;
		}
		
		return genre_str;
	}
		
	public void setGenre_str(String genre_str) {
		this.genre_str = genre_str;
	}
	public void setGenre(String[] genre) {
		this.genre = genre;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String[] getGenre() {
		return genre;
	}

	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAuthkey() {
		return authkey;
	}

	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}

	public int getAuthstatus() {
		return authstatus;
	}

	public void setAuthstatus(int authstatus) {
		this.authstatus = authstatus;
	}

	public MemberDTO(String authkey, int authstatus, String id, String email, String[] genre, String genre_str,
			String grade, String pw, int age, String name, String gender) {
		super();
		this.authkey = authkey;
		this.authstatus = authstatus;
		this.id = id;
		this.email = email;
		this.genre = genre;
		this.genre_str = genre_str;
		this.grade = grade;
		this.pw = pw;
		this.age = age;
		this.name = name;
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "MemberDTO [authkey=" + authkey + ", authstatus=" + authstatus + ", id=" + id + ", email=" + email
				+ ", genre=" + Arrays.toString(genre) + ", genre_str=" + genre_str + ", grade=" + grade + ", pw=" + pw
				+ ", age=" + age + ", name=" + name + ", gender=" + gender + "]";
	}

	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	


}