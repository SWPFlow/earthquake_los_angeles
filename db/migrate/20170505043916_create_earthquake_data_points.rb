class CreateEarthquakeDataPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :earthquake_data_points do |t|
      t.float :latitude
      t.float :longitude
      t.datetime :earthquake_date
      t.string :place
      t.float :magnitude

      t.timestamps
      t.index :earthquake_date
    end
  end
end
