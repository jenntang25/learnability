class AddUserToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :user, :string
  end
end
