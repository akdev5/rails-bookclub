class BooksGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :bookgenres do |t|
      t.belongs_to :BooksGenres
    end
  end
end
