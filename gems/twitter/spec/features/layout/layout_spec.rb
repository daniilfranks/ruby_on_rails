require 'rails_helper'

describe 'Layout' do
  scenario 'menu links' do
    visit root_path

    expect(page).to have_link('Home', visible: false)
    expect(page).to have_link('Users', visible: false)
    expect(page).to have_link('Login', visible: false)
  end
end