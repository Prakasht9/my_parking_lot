 class CreateParkingSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_spaces do |t|

      t.string :spot_number, null: false,default: ""
      t.string :type
      t.string :vehicle_number, null: false, default: ""
      t.string :parking_number, null: false, default: ""

      t.timestamps
    end
  end
end
