require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @post = create(:post)
  end

  it 'can be created' do
    expect(@post).to be_valid
  end

  it 'has a description instance variable' do
    expect(@post.title).to eq('First post')
  end

  it 'has a description instance variable' do
    expect(@post.description).to eq('my text')
  end

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }

  it { should validate_length_of(:title).is_at_least(5) }
  it { should validate_length_of(:description).is_at_least(5) }
end