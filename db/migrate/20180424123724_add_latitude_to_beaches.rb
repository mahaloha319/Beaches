class AddLatitudeToBeaches < ActiveRecord::Migration[5.1]
  def change
    add_column :beaches, :latitude, :float
  end
end
