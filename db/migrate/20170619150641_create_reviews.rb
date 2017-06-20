class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :appointment, foreign_key: true
      t.references :course, foreign_key: true
      t.text :content
      t.integer :stars

      t.timestamps
    end
  end
end
