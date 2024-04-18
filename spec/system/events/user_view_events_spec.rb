require 'rails_helper'

description 'Visitante vê eventos' do
  it 'com sucesso' do
    create(:event, name: 'Lual das Estrelas' )

    visit root_path

    expect(page).to have_content('Lual das Estrelas')
  end

  it 'e não existem eventos' do
    visit root_path

    expect(page).to have_content('Não há eventos')
  end
end

