require 'rails_helper'

RSpec.describe Army, type: :model do
  let(:army) { Army.new(
    id: 100,
    name: 'Forces of Nickelback'
  ) }

  describe 'validations' do
    describe 'name' do
      it 'must be present' do
        expect(army).to be_valid
        army.name = nil
        expect(army).to_not be_valid
      end
    end
  end
end
