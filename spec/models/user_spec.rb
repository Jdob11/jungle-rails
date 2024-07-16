require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    let(:valid_attributes) do
      {
        email: 'Ban@na.com',
        password: 'PaSsWoRd',
        password_confirmation: 'PaSsWoRd',
        first_name: 'El',
        last_name: 'Jefe'
      }
    end

    it 'should save when all fields are given' do
      user = User.new(valid_attributes)
      expect(user).to be_valid
    end
  end
end
