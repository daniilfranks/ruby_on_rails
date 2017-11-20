require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'validation tests' do
    it 'ensures title presence' do
      task = Task.new(description: 'text', complete: false, priority: 3, position: 3).save
      expect(task).to eq(false)
    end

    it 'ensures description presence' do
      task = Task.new(title: 'First task', complete: false, priority: 3, position: 3).save
      expect(task).to eq(false)
    end

    it 'ensures priority presence' do
      task = Task.new(title: 'First task', description: 'text', complete: false, position: 3).save
      expect(task).to eq(false)
    end

    it 'ensures position presence' do
      task = Task.new(title: 'First task', description: 'text', complete: false, priority: 3).save
      expect(task).to eq(false)
    end
  end

  context 'shoulda matchers' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
