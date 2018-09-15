require 'rails_helper'

RSpec.describe Group, type: :model do
  user = User.create(
    id: 98,
    username: 'John',
    email: 'otherjohn@gmail.com',
    password: 'password'
  )

  let(:group) { Group.new(
    id: 100,
    name: 'Nickelback Stronghold',
    owner: user
  ) }

  describe 'validations' do
    describe 'name' do
      it 'must be present' do
        expect(group).to be_valid
        group.name = nil
        expect(group).to_not be_valid
      end
    end

    describe 'owner_id' do
      it 'must be present' do
        expect(group).to be_valid
        group.owner = nil
        expect(group).to_not be_valid
      end
    end
  end
end
