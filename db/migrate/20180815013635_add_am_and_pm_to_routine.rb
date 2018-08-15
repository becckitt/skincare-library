class AddAmAndPmToRoutine < ActiveRecord::Migration[5.2]
  def change
    add_column :routines, :time_of_day, :integer
  end
end
