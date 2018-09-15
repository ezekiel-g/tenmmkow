require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(
    id: 97,
    username: 'Johnhy',
    email: 'thirdjohn@gmail.com',
    password: 'password'
  ) }

  describe 'validations' do
    describe 'username' do
      it 'must be present' do
        expect(user).to be_valid
        user.username = nil
        expect(user).to_not be_valid
      end
    end

    describe 'email' do
      it 'must be present' do
        expect(user).to be_valid
        user.email = nil
        expect(user).to_not be_valid
      end
    end

    describe 'password' do
      it 'must be present' do
        expect(user).to be_valid
        user.password = nil
        expect(user).to_not be_valid
      end

      it 'must have six or more characters' do
        expect(user).to be_valid
        user.password = 'cat'
        expect(user).to_not be_valid
      end
    end
  end
end
