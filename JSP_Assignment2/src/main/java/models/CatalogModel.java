package models;

public class CatalogModel {
    int book_id;
    String book_name;
    String author_name;
    int is_available;

    public CatalogModel(int book_id, String book_name, String author_name, int is_available) {
        this.book_id = book_id;
        this.book_name = book_name;
        this.author_name = author_name;
        this.is_available = is_available;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
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

    public int getIs_available() {
        return is_available;
    }

    public void setIs_available(int is_available) {
        this.is_available = is_available;
    }
}