class CreateAlbum < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :artist_id

      t.timestamps
    end
  end
end
