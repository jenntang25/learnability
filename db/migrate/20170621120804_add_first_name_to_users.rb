class AddFirstNameToUsers < ActiveRecord::Migration[5.0]
  def change

    add_column :users, :username, :string
    add_column :users, :description, :text
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :street, :string
    add_column :users, :postal_code, :string
    add_column :users, :city, :string
    add_column :users, :country, :string

  end
end
