require 'rails_helper'

describe 'Visitante vê eventos' do
  it 'com sucesso' do
    create(:event, name: 'Lual das Estrelas')
    create(:event, name: 'Conferência IA CHIP')

    visit root_path

    expect(page).to have_content('Lual das Estrelas')
    expect(page).to have_content('Conferência IA CHIP')
  end

  it 'e não existem eventos' do
    visit root_path

    expect(page).to have_content('Não há eventos')
  end
end

