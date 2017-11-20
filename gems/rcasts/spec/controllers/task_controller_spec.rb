require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, user: user, project: project) }

  context 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_success
    end
  end

  context 'GET #index' do
    it 'returns a success response' do
      get :show, params: { id: task.to_param }
      expect(response).to be_success
    end
  end
end
