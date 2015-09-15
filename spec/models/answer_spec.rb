require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should belong_to :question }
  it { should belong_to :user }

  it { should have_valid(:body).when('Name Name Name Name Name Name Name Name Name Name Name Name Name Name Name Name', 'Body Body Body Body Body Body Body Body Body Body Body Body Body Body Body Body') }
  it { should_not have_valid(:body).when(nil, '', 'too short') }
  it { should_not have_valid(:user_id).when(nil) }
  it { should_not have_valid(:question_id).when(nil)}
end
