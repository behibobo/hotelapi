class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.string :name
      t.integer :facility_type, limit: 1
      t.timestamps
    end
  end
end
