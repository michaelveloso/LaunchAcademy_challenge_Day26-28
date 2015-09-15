require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "username#{n}"}
    password 'password'
  end

  factory :question do
    sequence(:title) {|n| "Question #{n}"}
    sequence(:description) {|n| "Description #{n}"}
    User.create(username: "username", password: "password")
    user_id User.first.id
  end

  factory :answer do
    sequence(:body) {|n| "Answer #{n}"}
    question Question.new(title: "Question", description: "Description")
    User.create(username: "username", password: "password")
    user_id User.first.id
  end
end
