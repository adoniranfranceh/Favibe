require 'rails_helper'

describe 'Usuário vê tela inicial' do
  it 'ao acessar page' do
    visit root_path

    expect(page).to have_content 'Home'
  end
end
