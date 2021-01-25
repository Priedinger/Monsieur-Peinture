class AddRealisationToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :realisation_id, :integer
    add_foreign_key :photos, :realisations
  end
end
