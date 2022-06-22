class CreateSongsGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :song_genres do |t|
      t.references :song
      t.references :genre
    end
  end
end
