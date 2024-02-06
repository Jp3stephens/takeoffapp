class CreateMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.float :unit_size
      t.float :unit_price

      t.timestamps
    end
  end
end
