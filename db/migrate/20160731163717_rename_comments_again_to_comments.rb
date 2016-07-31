class RenameCommentsAgainToComments < ActiveRecord::Migration
  def change
  	rename_table :comments_agains, :comments
  end
end
