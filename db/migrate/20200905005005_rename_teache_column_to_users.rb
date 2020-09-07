class RenameTeacheColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :teache, :teacher
  end
end
