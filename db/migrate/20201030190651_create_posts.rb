class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :titulo
      t.references :user, null: false, foreign_key: true, index: true
      t.integer :status

      t.timestamps
    end
  end
end