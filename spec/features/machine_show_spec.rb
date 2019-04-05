require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  it 'shows the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it 'shows all snacks for that machine and the average price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(name: 'White Castle Burger', price: 3.50)
    snack_2 = dons.snacks.create(name: 'Pop Rocks', price: 1.50)
    snack_3 = dons.snacks.create(name: 'Flaming Hot Cheetos', price: 2.50)

    visit machine_path(dons)

    expect(page).to have_content("#{snack_1.name}: $#{snack_1.price}")
    expect(page).to have_content("#{snack_2.name}: $#{snack_2.price}")
    expect(page).to have_content("#{snack_3.name}: $#{snack_3.price}")
    expect(page).to have_content("Average Price: $2.50")
  end
end
