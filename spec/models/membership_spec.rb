require 'rails_helper'

RSpec.describe Membership, type: :model do
  user = User.create(
    id: 98,
    username: 'John',
    email: 'otherjohn@gmail.com',
    password: 'password'
  )

  army = Army.create(
    name: 'Forces of Creed'
  )

  group = Group.create(
    name: 'Creed Stronghold',
    owner: user
  )

  let(:membership) { Membership.new(
    user: user,
    army: army,
    group: group
  ) }

  describe 'validations' do
    describe 'user' do
      it 'must be present' do
        expect(membership).to be_valid
        membership.user = nil
        expect(membership).to_not be_valid
      end
    end

    describe 'army' do
      it 'must be present' do
        expect(membership).to be_valid
        membership.army = nil
        expect(membership).to_not be_valid
      end
    end

    describe 'group' do
      it 'must be present' do
        expect(membership).to be_valid
        membership.group = nil
        expect(membership).to_not be_valid
      end
    end
  end
end
