class AddNameToEstablishments < ActiveRecord::Migration[5.0]
  def change
    add_column :establishments, :name, :string
  end
end
