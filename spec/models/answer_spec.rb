require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should belong_to :question }
  it { should belong_to :user }

  it { should have_valid(:body).when('Name', 'Name 2') }
  it { should_not have_valid(:body).when(nil, '') }
  it { should_not have_valid(:user).when(nil) }
  it { should_not have_valid(:question).when(nil)}
end
