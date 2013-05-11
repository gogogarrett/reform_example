class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :locale, default: "en"
      t.string :email
      t.integer :age
      t.integer :user_id

      t.timestamps
    end
  end
end
