class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :body, presence: true, length: {minimum: 50}
end
