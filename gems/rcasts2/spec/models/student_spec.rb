require 'rails_helper'

RSpec.describe Student, type: :model do
  before do
    @student = create(:student)
  end

  it 'can be created' do
    expect(@student).to be_valid
  end

  it 'has a f_name instance variable' do
    expect(@student.f_name).to eq('Den')
  end

  it 'has a l_name instance variable' do
    expect(@student.l_name).to eq('Babanov')
  end

  it 'has an active attribute that defaults to false' do
    expect(@student.active).to eq(false)
  end
end
