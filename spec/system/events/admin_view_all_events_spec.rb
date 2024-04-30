require 'rails_helper'

describe 'Administrador vê eventos' do
  it 'a partir da tela inicial' do
    create(:event, name: 'Lual das Estrelas', status: :published)
    create(:event, name: 'Conferência IA CHIP', status: :published)
    create(:event, name: 'Evento a ser lançado', status: :hidden)

    visit root_path
    click_on 'Eventos'

    expect(page).to have_content 'Lual das Estrelas'
    expect(page).to have_content 'Conferência IA CHIP'
    expect(page).to have_content 'Evento a ser lançado'
  end

  it 'e não há eventos' do
    visit events_path
    click_on 'Todos os Eventos'

    expect(page).to have_content 'Não há eventos'
  end

  context 'ocultos' do
    it 'com sucesso' do
      create(:event, name: 'Lual das Estrelas', status: :published)
      create(:event, name: 'Conferência IA CHIP', status: :published)
      create(:event, name: 'Evento a ser lançado', status: :hidden)
  
      visit events_path
      click_on 'Eventos Ocultos'
  
      expect(page).not_to have_content 'Lual das Estrelas'
      expect(page).not_to have_content 'Conferência IA CHIP'
      expect(page).to have_content 'Evento a ser lançado'
    end
  
    it 'e não há eventos ocultos' do
      create(:event, name: 'Lual das Estrelas', status: :published)
      create(:event, name: 'Conferência IA CHIP', status: :published)

      visit events_path
      click_on 'Eventos Ocultos'
  
      expect(page).to have_content 'Não há eventos ocultos'
    end
  end

  context 'públicos' do
    it 'com sucesso' do
      create(:event, name: 'Lual das Estrelas', status: :published)
      create(:event, name: 'Conferência IA CHIP', status: :published)
      create(:event, name: 'Evento a ser lançado', status: :hidden)
  
      visit events_path
      click_on 'Eventos Públicos'
  
      expect(page).to have_content 'Lual das Estrelas'
      expect(page).to have_content 'Conferência IA CHIP'
      expect(page).not_to have_content 'Evento a ser lançado'
    end
  
    it 'e não há eventos privados' do
      create(:event, name: 'Evento a ser lançado', status: :hidden)

      visit events_path
      click_on 'Eventos Públicos'
  
      expect(page).to have_content 'Não há eventos públicos'
    end
  end
end
