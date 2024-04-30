require 'rails_helper'

describe 'Visitante vê tela inicial' do
  it 'e vê apenas eventos públicos' do
    create(:event, name: 'Lual das Estrelas', status: :published)
    create(:event, name: 'Conferência IA CHIP', status: :published)
    create(:event, name: 'Evento a ser lançado', status: :hidden)

    visit root_path

    expect(page).to have_content('Lual das Estrelas')
    expect(page).to have_content('Conferência IA CHIP')
    expect(page).not_to have_content('Evento a ser lançado')
  end

  it 'e não existem eventos' do
    visit root_path

    expect(page).to have_content('Não há eventos')
  end
end

