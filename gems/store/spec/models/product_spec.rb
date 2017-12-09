require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:product) { create(:product) }

  it 'should be valid' do
    expect(product).to be_valid
  end

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:image_url) }
  it { should validate_presence_of(:price) }

  it { should validate_uniqueness_of(:title) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.01) }
end
