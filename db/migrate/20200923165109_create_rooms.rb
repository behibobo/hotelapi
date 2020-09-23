class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :hotel, foreign_key: true
      t.integer :room_type
      t.string :room_no
      t.integer :status

      t.timestamps
    end
  end
end
