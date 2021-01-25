class AddPositionToPhoto < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :position, :integer
  end
end
