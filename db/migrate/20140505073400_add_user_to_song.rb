class AddUserToSong < ActiveRecord::Migration
  def change
    add_column :songs, :user_id, :integer
  end
end
