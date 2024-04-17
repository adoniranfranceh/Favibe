require 'rails_helper'

describe 'Usuário se loga' do
  it 'com sucesso' do
    User.create(email: 'admin@admin.com', password: '123456', password_confirmation: '123456')

    visit root_path

    fill_in 'Email', with: 'admin@admin.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    expect(page).to have_content 'Signed in successfully.'
  end

  it 'e faz logout' do

  end
end
