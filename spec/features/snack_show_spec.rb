require 'rails_helper'

RSpec.describe 'snack show page', type: :feature do
  describe 'when I visit a snack show page' do
    it 'shows snack attributes' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      oneup  = owner.machines.create(location: "1Up")
      snack_1 = dons.snacks.create(name: 'White Castle Burger', price: 3.50)
      snack_2 = dons.snacks.create(name: 'Pop Rocks', price: 1.50)
      snack_3 = dons.snacks.create(name: 'Flaming Hot Cheetos', price: 2.50)
      oneup.snacks << snack_1

      visit snack_path(snack_1)

      expect(page).to have_content(snack_1.name)
      expect(page).to have_content(dons.location)
      expect(page).to have_content(oneup.location)
      expect(page).to have_content("Don's Mixed Drinks Average Price: $2.50")
      expect(page).to have_content("1Up Average Price: $3.50")
      expect(page).to have_content("Don's Mixed Drinks Total Items: 3")
      expect(page).to have_content("1Up Total Items: 3")

    end
  end
end
