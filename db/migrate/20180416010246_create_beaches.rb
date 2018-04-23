class CreateBeaches < ActiveRecord::Migration[5.1]
  def change
    create_table :beaches do |t|
      t.string :name, :null => false
      t.string :address
      t.string :information
      t.string :image

      t.timestamps
    end
  end
end
