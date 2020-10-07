class CreateVicinities < ActiveRecord::Migration[5.2]
  def change
    create_table :vicinities do |t|
      t.string :name
      t.references :hotel, foreign_key: true

      t.timestamps
    end
  end
end
