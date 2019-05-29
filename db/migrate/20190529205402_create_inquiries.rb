class CreateInquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiries do |t|
      t.integer :sublessee_id
      t.integer :sublessor_id
      t.integer :housing_id
      t.string :inquiry_details

      t.timestamps
    end
  end
end
