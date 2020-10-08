class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :hotel, foreign_key: true
      t.integer :contact_type
      t.string :value

      t.timestamps
    end
  end
end
