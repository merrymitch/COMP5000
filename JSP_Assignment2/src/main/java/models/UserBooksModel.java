package models;

public class UserBooksModel {
    String book_name;
    String author_name;

    public UserBooksModel(String book_name, String author_name) {
        this.book_name = book_name;
        this.author_name = author_name;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getAuthor_name() {
        return author_name;
    }

    public void setAuthor_name(String author_name) {
        this.author_name = author_name;
    }
}