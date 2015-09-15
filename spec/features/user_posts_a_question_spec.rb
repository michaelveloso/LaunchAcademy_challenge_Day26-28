require 'rails_helper'

LONG_STRING = 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.'

feature 'user can view details of a question', %Q{
  As a user
  I want to post a question
  So that I can receive help from others
} do

# Acceptance Criteria
#
# - I must provide a title that is at least 40 characters long
# - I must provide a description that is at least 150 characters long
# - I must be presented with errors if I fill out the form incorrectly

  scenario 'can navigate to form' do
    visit '/questions'
    click_link ('Add a new question!')
    expect(page).to have_content('New Question')
  end

  feature 'filling in form incorrectly shows errors' do
    scenario 'filling in title incorrectly' do
      visit '/questions/new'
      fill_in 'Description', with: LONG_STRING
      click_button ('Create Question')
      expect(page).to have_content('Title can\'t be blank')
      fill_in 'Title', with: 'Title too short'
      click_button ('Create Question')
      expect(page).to have_content('Title is too short (minimum is 40 characters)')
    end

    scenario 'filling in description incorrectly' do
      visit '/questions/new'
      fill_in 'Title', with: LONG_STRING
      click_button ('Create Question')
      expect(page).to have_content('Description can\'t be blank')
      fill_in 'Description', with: 'Descripton too short'
      click_button ('Create Question')
      expect(page).to have_content('Description is too short (minimum is 150 characters)')
    end

    scenario 'filling in duplicate title' do
      question = FactoryGirl.create(:question)
      visit '/questions/new'
      fill_in 'Title', with: question.title
      fill_in 'Description', with: question.description
      click_button ('Create Question')
      expect(page).to have_content('Title has already been taken')
    end

  end

  feature 'user fills in form correctly' do
    scenario 'filling in form correctly shows success message' do
      visit '/questions/new'
      fill_in 'Title', with: LONG_STRING
      fill_in 'Description', with: LONG_STRING
      click_button ('Create Question')
      expect(page).to_not have_content('Title can\'t be blank')
      expect(page).to_not have_content('Title is too short (minimum is 40 characters)')
      expect(page).to_not have_content('Description can\'t be blank')
      expect(page).to_not have_content('Description is too short (minimum is 150 characters)')
      expect(page).to_not have_content('Title has already been taken')
      expect(page).to have_content('Question added')
    end

    scenario 'filling in form correctly takes user to question show page' do
      visit '/questions/new'
      fill_in 'Title', with: LONG_STRING
      fill_in 'Description', with: LONG_STRING
      click_button ('Create Question')
      expect(page).to have_content(LONG_STRING)
    end
  end
end
