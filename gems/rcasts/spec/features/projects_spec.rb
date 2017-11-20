require 'rails_helper'

RSpec.feature 'Projects', type: :feature do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  context 'should be successful' do
    scenario 'should be successful' do
      visit projects_path

      expect(page).to have_content 'Projects'
    end

    scenario 'should be successful' do
      visit project_path(project)

      expect(page).to have_content 'First project'
    end
  end
end
