class CreateEstablishments < ActiveRecord::Migration[5.0]
  def change
    create_table :establishments do |t|
      t.references :user, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.string :street
      t.integer :postal_code
      t.string :city
      t.string :country
      t.text :description

      t.timestamps
    end
  end
end
