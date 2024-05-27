class CreateVacations < ActiveRecord::Migration[6.1]
  def change
    create_table :vacations do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
