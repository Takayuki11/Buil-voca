class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :eikenlevel
      t.string :toeiclevel
      t.string :goal
      t.string :password_digest
      t.boolean :teache, default:false
      t.string :image

      t.timestamps
    end
  end
end
