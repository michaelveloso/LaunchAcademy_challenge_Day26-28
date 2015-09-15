require 'rails_helper'

feature 'user sees all questions', %Q{
  As a user
  I want to view recently posted questions
  So that I can help others
} do

  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first

  scenario 'sees all questions' do
    question_1 = FactoryGirl.create(:question)
    question_2 = FactoryGirl.create(:question)
    visit '/questions'

    expect(page).to have_content(question_1.title)
    expect(page).to have_content(question_2.title)
  end

end
