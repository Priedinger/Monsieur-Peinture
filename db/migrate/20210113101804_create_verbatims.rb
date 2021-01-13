class CreateVerbatims < ActiveRecord::Migration[6.0]
  def change
    create_table :verbatims do |t|
      t.string :author
      t.text :citation

      t.timestamps
    end
  end
end
