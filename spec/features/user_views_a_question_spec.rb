require 'rails_helper'

feature 'user can view details of a question', %Q{
  As a user
  I want to view the details of a question
  So I can understand it better
} do

#   Acceptance Criteria
#
# - I must be able to get to this page from the questions index
# - I must see the question's title
# - I must see the question's description

  scenario 'can click on question' do
    question = FactoryGirl.create(:question)
    visit '/questions'
    find_link(question.title).visible?
  end

  scenario 'clicking question shows details of question' do
    question = FactoryGirl.create(:question)
    visit '/questions'
    click_link (question.title)
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end

end
