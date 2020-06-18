class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :tag
      t.string :url
      t.belongs_to :expert, null: false, foreign_key: true

      t.timestamps
    end
  end
end
