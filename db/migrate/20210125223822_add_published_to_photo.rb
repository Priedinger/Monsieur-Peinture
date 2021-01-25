class AddPublishedToPhoto < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :published, :boolean, default: false
  end
end
