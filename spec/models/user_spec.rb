require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :questions }
  it { should have_many :answers }

  it { should have_valid(:username).when('Name', 'Name 2') }
  it { should_not have_valid(:username).when(nil, '') }
  it { should have_valid(:password).when('password', 'password2') }
  it { should_not have_valid(:password).when(nil, '') }

  context 'uniqueness' do
    it 'requires a unique username' do
      user = FactoryGirl.create(:user)
      dupe_user = FactoryGirl.build(:user, username: user.username)
      expect(dupe_user).to_not be_valid
      expect(dupe_user.errors[:username]).to_not be_empty
    end
  end
end
