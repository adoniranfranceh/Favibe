require 'rails_helper'

describe 'Usuário cria conta admin' do
  it 'com sucesso' do
    visit root_path

    click_on 'Criar conta'

    fill_in 'E-mail', with: 'usuario@email.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme sua senha', with: '123456'
    click_on 'Criar conta'

    expect(page).to have_content 'Você realizou seu registro com sucesso.'
    expect(User.count).to eq 1
    expect(User.last.email).to eq 'usuario@email.com'    
  end

  it 'e não cria uma conta com campos vazios' do
    visit new_user_registration_path
    fill_in 'E-mail', with: ''
    fill_in 'Senha', with: ''
    fill_in 'Confirme sua senha', with: ''
    click_on 'Criar conta'

    expect(page).to have_content 'Não foi possível salvar usuário: 2 erros.'
    expect(page).to have_content 'E-mail não pode ficar em branco'
    expect(page).to have_content 'Senha não pode ficar em branco'
    expect(User.all).to be_empty
  end

  it 'e não cria uma conta com campos inválidos' do
    create(:user, email: 'email@email.com')

    visit new_user_registration_path
    fill_in 'E-mail', with: 'email@email.com'
    fill_in 'Senha', with: '12345'
    fill_in 'Confirme sua senha', with: ''
    click_on 'Criar conta'

    expect(page).to have_content 'Não foi possível salvar usuário'
    expect(page).to have_content 'E-mail já está em uso'
    expect(page).to have_content 'Senha é muito curta (mínimo: 6 caracteres)'
    expect(page).to have_content 'Confirme sua senha não é igual a Senha'
    expect(User.count).to eq 1
  end
end
