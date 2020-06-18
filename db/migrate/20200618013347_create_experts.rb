class CreateExperts < ActiveRecord::Migration[6.0]
  def change
    create_table :experts do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
