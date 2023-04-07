require 'rails_helper'

describe Food do
  it 'has attributes' do
    sweet_potatoes_data = FoodService.new.food_search('sweet potatoes')[:foods]

    sweet_potatoe = Food.new(sweet_potatoes_data.first)

    expect(sweet_potatoe.code).to eq('8901020020844')
    expect(sweet_potatoe.description).to eq('SWEET POTATOES')
    expect(sweet_potatoe.brand_owner).to eq('NOT A BRANDED ITEM')
    expect(sweet_potatoe.ingredients).to eq('ORGANIC SWEET POTATOES.')
  end
end