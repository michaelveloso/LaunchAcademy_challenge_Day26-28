class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }
end
