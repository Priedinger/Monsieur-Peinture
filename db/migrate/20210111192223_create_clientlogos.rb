class CreateClientlogos < ActiveRecord::Migration[6.0]
  def change
    create_table :clientlogos do |t|
      t.string :name
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
