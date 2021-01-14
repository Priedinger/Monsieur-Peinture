class CreateCounters < ActiveRecord::Migration[6.0]
  def change
    create_table :counters do |t|
      t.integer :surface

      t.timestamps
    end
  end
end
