class AddPositionToRealisation < ActiveRecord::Migration[6.0]
  def change
    add_column :realisations, :position, :integer
  end
end
