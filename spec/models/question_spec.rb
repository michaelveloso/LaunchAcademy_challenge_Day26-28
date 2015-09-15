require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should have_many :answers }

  it { should have_valid(:title).when('Name', 'Name 2') }
  it { should_not have_valid(:title).when(nil, '') }

  it { should_not have_valid(:user).when(nil)}
  context 'uniqueness' do
    it 'requires a unique name' do
      question = FactoryGirl.create(:question)
      dupe_question = FactoryGirl.build(:question, title: question.title)
      expect(dupe_question).to_not be_valid
      expect(dupe_question.errors[:title]).to_not be_empty
    end
  end

end
