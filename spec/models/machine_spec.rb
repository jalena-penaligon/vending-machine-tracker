require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :machine_snacks }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  describe 'calculations' do
    it 'can calculate snack average price' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack_1 = dons.snacks.create(name: 'White Castle Burger', price: 3.50)
      snack_2 = dons.snacks.create(name: 'Pop Rocks', price: 1.50)
      snack_3 = dons.snacks.create(name: 'Flaming Hot Cheetos', price: 2.50)

      expect(dons.average_price).to eq(2.50)
    end
  end
end
