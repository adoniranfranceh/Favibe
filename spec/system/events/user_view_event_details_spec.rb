require 'rails_helper'

describe 'Usuário vê detalhes de um evento' do
  it 'com sucesso' do
    travel_to Time.zone.local(2025, 10, 26, 12, 30, 00)

    create(:event, name: 'Festival de sonhos',
                   description: 'Participe do maior festival de sonhos',
                   event_start: '2025-10-28 15:30:00',
                   event_end: '2025-10-28 19:00:00',
                   location: 'Rua das Palmeiras',
                   category: 'Festival',
                   status: :published
          )
    create(:event, name: 'Outro evento', status: :published)

    visit root_path
    click_on 'Festival de sonhos'
    
    expect(page).to have_content 'Festival de sonhos'
    expect(page).to have_content "Descrição:\nParticipe do maior festival de sonhos"
    expect(page).to have_content "Início do evento:\n28/10/2025 15:30"
    expect(page).to have_content "Fim do evento:\n28/10/2025 19:00"
    expect(page).to have_content "Localização:\nRua das Palmeiras"
    expect(page).to have_content "Categoria:\nFestival"
    expect(page).to have_content "Status:\nPublicado"
    expect(page).not_to have_content 'Outro evento'
    travel_back
  end

  it 'e retorna para tela de listagem' do
    event = create(:event, name: 'Festival das plantas')
    create(:event, name: 'Conferência UNI')

    visit event_path(event)
    click_on 'Voltar'

    expect(page).to have_current_path root_path
    expect(page).to have_content 'Festival das plantas'
    expect(page).to have_content 'Conferência UNI'
  end
end
