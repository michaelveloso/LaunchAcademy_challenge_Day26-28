class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy

  validates :title, presence: true, uniqueness: true#, length: {minimum: 40}
  validates :description, presence: true#, length: {minimum: 150}
  validates :user, presence: true
end
