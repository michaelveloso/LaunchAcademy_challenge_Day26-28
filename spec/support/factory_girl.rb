require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "username#{n}"}
    password 'password'
  end

  factory :question do
    sequence(:title) {|n| "Question #{n}"}
    sequence(:description) {|n| "Description #{n}"}
    user User.new(username: "name", password: "password")
  end

  factory :answer do
    sequence(:body) {|n| "Answer #{n}"}
    question Question.new(title: "Question", description: "Description")
    user User.new(username: "name", password: "password")
  end
end
