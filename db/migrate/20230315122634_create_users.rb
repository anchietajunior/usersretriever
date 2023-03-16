class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone
      t.string :gender
      t.integer :height
      t.float :weigth
      t.date :birthdate
      t.string :image
      t.string :university

      t.timestamps
    end
  end
end
