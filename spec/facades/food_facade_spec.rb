require 'rails_helper'

describe FoodFacade do
  context 'instance methods' do
    describe '#food_search' do
      it 'creates Food poros for the first 10 results of food_search' do
        params = {q: 'sweet potatoes'}
        
        sweet_potatoes = FoodFacade.new(params).food_search

        expect(sweet_potatoes.first).to be_a Food
        expect(sweet_potatoes.count).to eq(10)
      end
    end

    describe '#total_results' do
      it 'returns the total number of results for a search' do
        params = {q: 'sweet potatoes'}
          
        total = FoodFacade.new(params).total_results

        expect(total).to be_an Integer
        expect(total).to eq(51270)
      end
    end
  end
end