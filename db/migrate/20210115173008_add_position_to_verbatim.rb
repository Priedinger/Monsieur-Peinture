class AddPositionToVerbatim < ActiveRecord::Migration[6.0]
  def change
     add_column :verbatims, :position, :integer
  end
end
