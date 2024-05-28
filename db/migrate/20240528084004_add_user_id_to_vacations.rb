class AddUserIdToVacations < ActiveRecord::Migration[6.1]
  def change
    add_reference :vacations, :user, null: false, foreign_key: true
  end
end
