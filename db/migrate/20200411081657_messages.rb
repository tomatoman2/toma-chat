class Messages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :image, null: false
      t.text :content, null: false
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
