class AddIndexToUsersNameAndEmail < ActiveRecord::Migration[7.0]
  def change
    add_index :users, [:name, :email]
  end
end
