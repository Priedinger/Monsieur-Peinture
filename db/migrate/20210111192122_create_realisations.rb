class CreateRealisations < ActiveRecord::Migration[6.0]
  def change
    create_table :realisations do |t|
      t.string :category
      t.string :title
      t.string :client
      t.string :localization
      t.string :agency
      t.string :artist
      t.string :surface
      t.string :duration
      t.string :photo_credits
      t.text :description
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
