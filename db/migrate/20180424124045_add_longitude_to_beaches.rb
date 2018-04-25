class AddLongitudeToBeaches < ActiveRecord::Migration[5.1]
  def change
    add_column :beaches, :longitude, :float
  end
end
