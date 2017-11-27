require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:category) { create(:category) }
  let(:tag) { create(:tag) }
  let(:tag2) { create(:tag, name: 'Second name') }
  let(:post) { create(:post, category_id: category.id) }

  before do
    PostTag.create(tag_id: tag.id, post_id: post.id)
    PostTag.create(tag_id: tag2.id, post_id: post.id)
  end

  it 'can be created' do
    expect(post).to be_valid
  end

  it 'has a description instance variable' do
    expect(post.title).to eq('First post')
  end

  it 'has a description instance variable' do
    expect(post.description).to eq('my text')
  end

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }

  it { should validate_length_of(:title).is_at_least(5) }
  it { should validate_length_of(:description).is_at_least(5) }

  it 'belongs to a category' do
    expect(post.category).to eq(category)
  end

  it 'has many tags' do
    expect(post.tags.count).to eq(2)
  end

  it "queries for posts today" do
    expect(Post.from_today.count).to eq(1)
  end
end
