require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "username#{n}"}
    password 'password'
  end

  factory :question do
    sequence(:title) {|n| "Question that for sure has more than 40 characters#{n}"}
    sequence(:description) {|n| "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."}
    User.create(username: "username", password: "password")
    user_id User.first.id
  end

  factory :answer do
    sequence(:body) {|n| "Answer that is almost certainly 50 characters long here's some filler to make sure #{n}"}
    question Question.new(title: "Question", description: "Description")
    User.create(username: "username", password: "password")
    user_id User.first.id
  end
end
