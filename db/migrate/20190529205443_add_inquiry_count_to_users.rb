class AddInquiryCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :inquiries_count, :integer
  end
end
