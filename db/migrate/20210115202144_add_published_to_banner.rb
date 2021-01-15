class AddPublishedToBanner < ActiveRecord::Migration[6.0]
  def change
    add_column :banners, :published, :boolean, default: false
  end
end
