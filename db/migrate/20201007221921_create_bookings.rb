class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :room, foreign_key: true
      t.references :passenger, foreign_key: true
      t.date :check_in_date
      t.date :check_out_date
      t.date :book_date
      t.integer :status

      t.timestamps
    end
  end
end
