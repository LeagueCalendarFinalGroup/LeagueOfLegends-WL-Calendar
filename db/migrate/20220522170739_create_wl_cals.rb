class CreateWlCals < ActiveRecord::Migration[7.0]
  def change
    create_table :wl_cals do |t|

      t.timestamps
    end
  end
end
