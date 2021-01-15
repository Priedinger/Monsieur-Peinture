class AddPositionToBanner < ActiveRecord::Migration[6.0]
  def change
    add_column :banners, :position, :integer
  end
end
