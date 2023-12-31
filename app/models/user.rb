class User < ApplicationRecord
	# email属性を強制的に小文字
	before_save {email.downcase!}
	# name属性の存在性に関するテスト presence: 必須
	validates :name, presence: true, length: {maximum:50}
	# 正規表現パターンを定義
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum:255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: {minimum: 6}
end
