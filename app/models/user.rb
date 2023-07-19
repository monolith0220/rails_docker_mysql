class User < ApplicationRecord
	# name属性の存在性に関するテスト
	validates :name, presence: true
	validates :email, presence: true
end
