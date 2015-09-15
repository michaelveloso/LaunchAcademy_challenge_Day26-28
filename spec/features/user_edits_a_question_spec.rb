require 'rails_helper'

feature 'user can answer a question', %Q{
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates
  } do

# Acceptance Criteria
#
# - I must provide valid information
# - I must be presented with errors if I fill out the form incorrectly
# - I must be able to get to the edit page from the question details page

  LONG_TITLE = "This is a very very very very very very very very very long title"
  LONG_DESCRIPTION = "iam advenerat tertius dies et mane inclaruerat et ecce coeperunt audiri tonitrua ac micare fulgura et nubes densissima operire montem clangorque bucinae vehementius perstrepebat timuit populus qui erat in castris."

  feature 'user enters valid information' do
    scenario 'user is taken to question details page' do
      question = FactoryGirl.create(:question)
      link = "/questions/#{question.id}"
      visit link
      click_button "Edit"
      expect(page).to have_content("Edit")
    end

    scenario 'question title is updated correctly' do
      question = FactoryGirl.create(:question)
      link = "/questions/#{question.id}/edit"
      visit link
      fill_in "question_title", with: LONG_TITLE
      click_button "Update Question"
      expect(page).to have_content(LONG_TITLE)
      visit '/questions'
      expect(page).to have_content(LONG_TITLE)
    end

    scenario 'question description is updated correctly' do
      question = FactoryGirl.create(:question)
      link = "/questions/#{question.id}/edit"
      visit link
      fill_in "question_description", with: LONG_DESCRIPTION
      click_button "Update Question"
      expect(page).to have_content(LONG_DESCRIPTION)
    end
  end

  feature 'user enters invalid information' do
    scenario 'title field is incorrectly filled' do
      question = FactoryGirl.create(:question)
      link = "/questions/#{question.id}/edit"
      visit link
      fill_in "question_title", with: ""
      click_button "Update Question"
      expect(page).to have_content("can't be blank")
      fill_in "question_title", with: "Too short"
      click_button "Update Question"
      expect(page).to have_content("too short")
    end

    scenario 'description field is incorrectly filled' do
      question = FactoryGirl.create(:question)
      link = "/questions/#{question.id}/edit"
      visit link
      fill_in "question_description", with: ""
      click_button "Update Question"
      expect(page).to have_content("can't be blank")
      fill_in "question_description", with: "Too short"
      click_button "Update Question"
      expect(page).to have_content("too short")
    end
  end

  feature 'user can navigate to details page from edit page' do
    scenario 'edit page includes link to details page' do
      question = FactoryGirl.create(:question)
      link = "/questions/#{question.id}/edit"
      visit link
      click_link "Show"
    end
  end


end
