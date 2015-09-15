require 'rails_helper'

feature 'user can answer a question', %Q{
  As a user
  I want to answer another user's question
  So that I can help them solve their problem
} do

  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  LONG_STRING = "As a user I want to answer another user's question So that I can help them solve their problem"

  scenario 'can answer a question from show page' do
    question = FactoryGirl.create(:question)
    path = "/questions/#{question.id}"
    visit path
    fill_in 'answer_body', with: 'Anything'
  end

  scenario 'user fills out description correctly' do
    question = FactoryGirl.create(:question)
    path = "/questions/#{question.id}"
    visit path
    fill_in 'answer_body', with: LONG_STRING
    click_button 'Create Answer'
    expect(page).to have_content("Answer submitted!")
  end

  scenario 'user fills out description incorrectly' do
    question = FactoryGirl.create(:question)
    path = "/questions/#{question.id}"
    visit path
    click_button 'Create Answer'
    expect(page).to have_content("can't be blank")

    fill_in 'answer_body', with: "Short answer"
    click_button 'Create Answer'
    expect(page).to have_content("too short")

  end

end
