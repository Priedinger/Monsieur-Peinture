class RemoveDescriptionFromArticle < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :description, :text
  end
end
