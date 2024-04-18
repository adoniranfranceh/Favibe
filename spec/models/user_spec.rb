require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso se não houver e-mail' do
        user = User.new(email: '')

        expect(user.valid?).to be false
        expect(user.errors).to include :email
      end

      it 'falso se não houver senha' do
        user = User.new(password: '')

        expect(user.valid?).to be false
        expect(user.errors).to include :password
      end
    end

    context 'uniqueness' do
      it 'falso se e-mail já estiver utilizado' do
        create(:user, email: 'usuario@email.com')
        user = User.new(email: 'usuario@email.com')

        expect(user.valid?).to be false
        expect(user.errors).to include :email
      end
    end
  end
end