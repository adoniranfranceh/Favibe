require 'rails_helper'

describe 'Usuário vê tela inicial' do
  it 'ao acessar page' do
    user = User.create(email: 'admin@admin.com', password: '123456')
    login_as user, scope: :user

    visit root_path

    expect(page).to have_content 'Sobre Nossa Empresa'
  end
end
