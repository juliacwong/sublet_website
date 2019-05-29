class CreateHousingLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :housing_likes do |t|
      t.integer :sublessee_id
      t.integer :housing_id

      t.timestamps
    end
  end
end
