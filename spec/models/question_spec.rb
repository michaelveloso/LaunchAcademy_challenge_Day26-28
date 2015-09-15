require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should have_many :answers }

  it { should have_valid(:title).when('Question Question Question Question Question Question Question', 'Question Question Question Question Question Question Question Question Question Question Question') }
  it { should_not have_valid(:title).when(nil, '', 'Title too short') }

  it { should have_valid(:description).when('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')}

  it { should_not have_valid(:description).when(nil, '', 'Decsription too short')}

  it { should_not have_valid(:user_id).when(nil)}
  context 'uniqueness' do
    it 'requires a unique name' do
      question = FactoryGirl.create(:question)
      dupe_question = FactoryGirl.build(:question, title: question.title)
      expect(dupe_question).to_not be_valid
      expect(dupe_question.errors[:title]).to_not be_empty
    end
  end

end
