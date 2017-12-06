require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let!(:user) { create(:user, name: 'Danila', email: 'danila_babanov@yahoo.com', admin: true, activated: true, activated_at: Time.zone.now) }
  let!(:user2) { create(:user, activated: true, activated_at: Time.zone.now) }
  let!(:user3) { create(:user, activated: true, activated_at: Time.zone.now) }
  let!(:relationship) { Relationship.create(follower_id: user.id, followed_id: user2.id) }

  it 'should be valid' do
    expect(relationship).to be_valid
  end

  it 'should require a follower_id' do
    relationship.follower_id = nil
    expect(relationship).not_to be_valid
  end

  it 'should require a followed_id"' do
    relationship.followed_id = nil
    expect(relationship).not_to be_valid
  end

  it 'user follow' do
    user2.follow(user3)
    expect(user2.following?(user3)).to eq(true)
  end

  it 'user following?' do
    expect(user.following?(user2)).to eq(true)
  end

  it 'user not following?' do
    expect(user.following?(user3)).to eq(false)
  end

  it 'user unfollow' do
    user.unfollow(user2)
    expect(user.following?(user2)).to eq(false)
  end

  it 'user followers' do
    expect(user2.followers.include?(user)).to eq(true)
  end
end
