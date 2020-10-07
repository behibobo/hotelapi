class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.text :details
      t.references :city, foreign_key: true
      t.string :lat
      t.string :lng
      t.integer :rank
      t.integer :category
      t.timestamps
    end
  end
end
