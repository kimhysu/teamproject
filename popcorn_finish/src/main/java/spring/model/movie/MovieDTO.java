package spring.model.movie;

import java.io.Serializable;
import java.util.Arrays;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("movieDTO")
public class MovieDTO implements Serializable {
	private int movie_num;
	private String movie_name;
	private int movie_price;
	private String movie_content;
	private String movie_genre[];
	private String movie_genre_str;
	private String movie_grade;
	private String movie_cast;
	private String movie_date;

	private String movie_img1;
	private String movie_img2;
	private String movie_img3;
	private MultipartFile movie_img1MF;
	private MultipartFile movie_img2MF;
	private MultipartFile movie_img3MF;

	private String id;

	public int getMovie_num() {
		return movie_num;
	}

	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}

	public String getMovie_name() {
		return movie_name;
	}

	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}

	public int getMovie_price() {
		return movie_price;
	}

	public void setMovie_price(int movie_price) {
		this.movie_price = movie_price;
	}

	public String getMovie_content() {
		return movie_content;
	}

	public void setMovie_content(String movie_content) {
		this.movie_content = movie_content;
	}

	public String[] getMovie_genre() {
		return movie_genre;
	}

	public void setMovie_genre(String[] movie_genre) {
		this.movie_genre = movie_genre;
	}

	public String getMovie_genre_str() {
		if (movie_genre != null) {

			String movie_genre_str = "";
			for (int i = 0; i < movie_genre.length; i++) {
				movie_genre_str += movie_genre[i];
				if (i < movie_genre.length - 1) {
					movie_genre_str += ",";
				}
			}
			this.movie_genre_str = movie_genre_str;
		}
		return movie_genre_str;
	}

	public void setMovie_genre_str(String movie_genre_str) {
		this.movie_genre_str = movie_genre_str;
	}

	public String getMovie_grade() {
		return movie_grade;
	}

	public void setMovie_grade(String movie_grade) {
		this.movie_grade = movie_grade;
	}

	public String getMovie_cast() {
		return movie_cast;
	}

	public void setMovie_cast(String movie_cast) {
		this.movie_cast = movie_cast;
	}

	public String getMovie_date() {
		return movie_date;
	}

	public void setMovie_date(String movie_date) {
		this.movie_date = movie_date;
	}

	public String getMovie_img1() {
		return movie_img1;
	}

	public void setMovie_img1(String movie_img1) {
		this.movie_img1 = movie_img1;
	}

	public String getMovie_img2() {
		return movie_img2;
	}

	public void setMovie_img2(String movie_img2) {
		this.movie_img2 = movie_img2;
	}

	public String getMovie_img3() {
		return movie_img3;
	}

	public void setMovie_img3(String movie_img3) {
		this.movie_img3 = movie_img3;
	}

	public MultipartFile getMovie_img1MF() {
		return movie_img1MF;
	}

	public void setMovie_img1MF(MultipartFile movie_img1MF) {
		this.movie_img1MF = movie_img1MF;
	}

	public MultipartFile getMovie_img2MF() {
		return movie_img2MF;
	}

	public void setMovie_img2MF(MultipartFile movie_img2MF) {
		this.movie_img2MF = movie_img2MF;
	}

	public MultipartFile getMovie_img3MF() {
		return movie_img3MF;
	}

	public void setMovie_img3MF(MultipartFile movie_img3MF) {
		this.movie_img3MF = movie_img3MF;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public MovieDTO(int movie_num, String movie_name, int movie_price, String movie_content, String[] movie_genre,
			String movie_genre_str, String movie_grade, String movie_cast, String movie_date, String movie_img1,
			String movie_img2, String movie_img3, MultipartFile movie_img1MF, MultipartFile movie_img2MF,
			MultipartFile movie_img3MF, String id) {
		super();
		this.movie_num = movie_num;
		this.movie_name = movie_name;
		this.movie_price = movie_price;
		this.movie_content = movie_content;
		this.movie_genre = movie_genre;
		this.movie_genre_str = movie_genre_str;
		this.movie_grade = movie_grade;
		this.movie_cast = movie_cast;
		this.movie_date = movie_date;
		this.movie_img1 = movie_img1;
		this.movie_img2 = movie_img2;
		this.movie_img3 = movie_img3;
		this.movie_img1MF = movie_img1MF;
		this.movie_img2MF = movie_img2MF;
		this.movie_img3MF = movie_img3MF;
		this.id = id;
	}

	public MovieDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "MovieDTO [movie_num=" + movie_num + ", movie_name=" + movie_name + ", movie_price=" + movie_price
				+ ", movie_content=" + movie_content + ", movie_genre=" + Arrays.toString(movie_genre)
				+ ", movie_genre_str=" + movie_genre_str + ", movie_grade=" + movie_grade + ", movie_cast=" + movie_cast
				+ ", movie_date=" + movie_date + ", movie_img1=" + movie_img1 + ", movie_img2=" + movie_img2
				+ ", movie_img3=" + movie_img3 + ", movie_img1MF=" + movie_img1MF + ", movie_img2MF=" + movie_img2MF
				+ ", movie_img3MF=" + movie_img3MF + ", id=" + id + "]";
	}

}
