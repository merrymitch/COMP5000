package models;

public class BookModel {
    int book_id;
    int topic_id;
    String book_name;
    int author_id;
    int is_available;

    public BookModel(int book_id, int topic_id, String book_name, int author_id, int is_available) {
        this.book_id = book_id;
        this.topic_id = topic_id;
        this.book_name = book_name;
        this.author_id = author_id;
        this.is_available = is_available;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(int topic_id) {
        this.topic_id = topic_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public int getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }

    public int getIs_available() {
        return is_available;
    }

    public void setIs_available(int is_available) {
        this.is_available = is_available;
    }
}