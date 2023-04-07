require 'rails_helper'

describe FoodService do
  context 'instance methods' do
    context '#search_foods()' do
      it 'returns food data based on a search query' do
        food_data = FoodService.new.search_foods('sweet potatoes')

        expect(food_data).to be_a Hash

        expect(food_data).to have_key :totalHits
        expect(food_data[:totalHits]).to be_an Integer

        expect(food_data).to have_key :foods
        expect(food_data[:foods]).to be_an Array

        food = food_data[:foods].first

        expect(food).to have_key :gtinUpc
        expect(food[:gtinUpc]).to be_a String

        expect(food).to have_key :description
        expect(food[:description]).to be_a String

        expect(food).to have_key :brandOwner
        expect(food[:brandOwner]).to be_a String

        expect(food).to have_key :ingredients
        expect(food[:ingredients]).to be_a String
      end
    end
  end
end