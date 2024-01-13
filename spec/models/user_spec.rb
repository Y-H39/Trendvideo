require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'methods' do
    describe '.guest' do
      it 'returns the guest user' do
        guest_user = User.guest
        expect(guest_user.name).to eq('ゲスト')
        expect(guest_user.email).to eq('guest@example.com')
      end
    end
  end
end
