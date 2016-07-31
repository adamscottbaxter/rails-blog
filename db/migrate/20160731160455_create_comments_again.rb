class CreateCommentsAgain < ActiveRecord::Migration
  def change
    create_table :comments_agains do |t|
      t.string :name
      t.text :comment
      t.references :post, index: true, foreign_key: true
      
      t.timestamps(null: false)
    end
  end
end
