class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :content
      t.string :meaning
      t.string :example
      t.boolean :eiken, default:false
      t.boolean :toeic, default:false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
