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

    it 'should fail when password/confirmation is not given' do
      user = User.new(valid_attributes.merge(password: nil, password_confirmation: nil))
      expect(user).not_to be_valid
    end

    it 'should fail when password/confirmation given do not match' do
      user = User.new(valid_attributes.merge(password: "1234", password_confirmation: "4321"))
      expect(user).not_to be_valid
    end

    it 'should fail when email is not given' do
      user = User.new(valid_attributes.merge(email: nil))
      expect(user).not_to be_valid
    end

    it 'should fail when email given is already in database' do
      user1 = User.create!(valid_attributes.merge(email: 'user@email.com'))
      user2 = User.new(valid_attributes.merge(email: 'user@email.com'))
      expect(user2).not_to be_valid
    end

    it 'should fail when email given is already in database (case insensitive)' do
      user1 = User.create!(valid_attributes.merge(email: 'USER@email.com'))
      user2 = User.new(valid_attributes.merge(email: 'user@email.com'))
      expect(user2).not_to be_valid
    end

    it 'should fail when first_name is not given' do
      user = User.new(valid_attributes.merge(first_name: nil))
      expect(user).not_to be_valid
    end

    it 'should fail when last_name is not given' do
      user = User.new(valid_attributes.merge(last_name: nil))
      expect(user).not_to be_valid
    end
  end
end

# user2.valid?
# puts user2.errors.full_messages