class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :pickup_address
      t.string :dropoff_address
      t.decimal :pickup_lat
      t.decimal :pickup_long      
      t.decimal :dropoff_lat
      t.decimal :dropoff_long            
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
