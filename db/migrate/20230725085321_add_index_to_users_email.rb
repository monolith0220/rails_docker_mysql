class AddIndexToUsersEmail < ActiveRecord::Migration[7.0]
  def change
    #add_index（indexを追加するためのヘルパーメソッド） テーブル名 カラム名 オプション
    add_index :users, :email, unique: true
  end
end
