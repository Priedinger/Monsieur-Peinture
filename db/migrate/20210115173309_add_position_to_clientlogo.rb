class AddPositionToClientlogo < ActiveRecord::Migration[6.0]
  def change
    add_column :clientlogos, :position, :integer
  end
end
