class CreateRoomFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :room_facilities do |t|
      t.references :room, foreign_key: true
      t.references :facility, foreign_key: true

      t.timestamps
    end
  end
end
