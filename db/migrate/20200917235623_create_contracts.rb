class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.date :from_date
      t.date :to_date
      t.references :hotel, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
