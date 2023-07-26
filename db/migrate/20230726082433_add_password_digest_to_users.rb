class AddPasswordDigestToUsers < ActiveRecord::Migration[7.0]
  # usersテーブルにpassword_digestカラムを追加する
  def change
    add_column :users, :password_digest, :string
  end
end
