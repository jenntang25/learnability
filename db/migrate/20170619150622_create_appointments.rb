class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true
      t.datetime :date
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
