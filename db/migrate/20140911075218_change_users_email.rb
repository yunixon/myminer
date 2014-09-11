class ChangeUsersEmail < ActiveRecord::Migration
  def change
    change_column_null :users, :email, true
    change_column_null :users, :nick, false
  end
end
