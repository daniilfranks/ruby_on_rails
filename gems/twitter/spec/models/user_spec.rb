require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user, name: 'Danila', email: 'danila_babanov@yahoo.com', admin: true) }

  it 'should be valid' do
    expect(user).to be_valid
  end

  it 'user admin?' do
    expect(user.admin).to eq(true)
  end

  it 'has a name instance variable' do
    expect(user.name).to eq('Danila')
  end

  it 'has a email instance variable' do
    expect(user.email).to eq('danila_babanov@yahoo.com')
  end

  it 'user activated?' do
    expect(user.activated?).to eq(false)
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }

  it { should validate_length_of(:name).is_at_most(50) }
  it { should validate_length_of(:email).is_at_most(255) }

  it { should allow_value('user@example.com', 
                          'USER@foo.COM', 
                          'A_US-ER@foo.bar.org', 
                          'first.last@foo.jp', 
                          'alice+bob@baz.cn').for(:email) }
  
  it { should_not allow_values('user@example,com', 
                               'user_at_foo.org', 
                               'user.name@example.',
                               'foo@bar_baz.com', 
                               'foo@bar+baz.com').for(:email) }

  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:password).is_at_least(6) }
end

describe 'Feed' do
  let!(:user) { create(:user, name: 'Danila', email: 'danila_babanov@yahoo.com', admin: true, activated: true, activated_at: Time.zone.now) }
  let!(:user2) { create(:user, activated: true, activated_at: Time.zone.now) }
  let!(:user3) { create(:user, activated: true, activated_at: Time.zone.now) }
  let!(:relationship) { Relationship.create(follower_id: user.id, followed_id: user2.id) }
  let!(:relationship) { Relationship.create(follower_id: user.id, followed_id: user3.id) }

  before do
    users = User.all
    users.each { |user| 5.times { create(:micropost, user_id: user.id) } }
  end

  it 'feed user' do
    expect(user.feed.includes(:user).count).to eq(10)
  end
end



