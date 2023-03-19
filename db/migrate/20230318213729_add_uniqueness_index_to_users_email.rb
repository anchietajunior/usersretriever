class AddUniquenessIndexToUsersEmail < ActiveRecord::Migration[7.0]
  def change
    execute "UPDATE users SET email = lower(email);"
    add_index :users, "lower(email)", unique: true
  end
end
