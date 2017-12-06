require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let!(:user) { create(:user, name: 'Danila', email: 'danila_babanov@yahoo.com', admin: true) }
  let!(:micropost) { create(:micropost, user_id: user.id, created_at: 2.hours.ago) }
  let!(:micropost2) { create(:micropost, user_id: user.id, created_at: Time.zone.now) }

  it 'should be valid' do
    expect(micropost).to be_valid
  end

  it 'user id should be present' do
    micropost.user_id = nil
    expect(micropost).not_to be_valid
  end

  it 'content should be present' do
    micropost.content = ''
    expect(micropost).not_to be_valid
  end

  it 'content should be at most 140 characters' do
    micropost.content = 'A' * 141
    expect(micropost).not_to be_valid
  end

  it 'order should be most recent first' do
    expect(User.first.id).to eq(1)
  end

  it 'associated microposts should be destroyed' do
    user.microposts.create(content: 'My message')
    expect(Micropost.count).to eq(3)
    user.destroy
    expect(Micropost.count).to eq(0)
  end
end
