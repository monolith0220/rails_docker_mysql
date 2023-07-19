class User < ApplicationRecord
	# name属性の存在性に関するテスト
	validates :name, presence: true, length: {maximum:50}
	validates :email, presence: true, length: {maximum:255}
end
