class ChangeVacationStatusField < ActiveRecord::Migration[6.1]
  def change
    remove_column :vacations, :status
    add_column :vacations, :status, :string, null: false, default: 'Unconfirmed'
  end
end
