class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :hotel, foreign_key: true
      t.string :number
      t.string :check_in_hour
      t.string :check_out_hour
      t.timestamps
    end
  end
end
