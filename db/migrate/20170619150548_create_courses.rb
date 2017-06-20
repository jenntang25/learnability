class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.references :establishment, foreign_key: true
      t.string :title
      t.string :category
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
