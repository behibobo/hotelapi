class AddTransferToHotel < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :transfer, :boolean, default: false
  end
end
