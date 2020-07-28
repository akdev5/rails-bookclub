class BooksGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :books_genres do |t|
      t.belongs_to :genre
      t.belongs_to :book
    end
  end
end
