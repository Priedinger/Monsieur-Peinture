class AddPositionToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :position, :integer
  end
end
