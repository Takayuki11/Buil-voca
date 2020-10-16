class AddtranslationTowords < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :translation, :string
  end
end
