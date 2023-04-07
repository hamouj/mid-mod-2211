require 'rails_helper'

describe 'Food Index Page' do
  context 'As a user' do
    context "When I search for 'sweet potaotes'" do
      before(:each) do
        params = {q: 'sweet potatoes'}
        @total_results = FoodFacade.new(params).total_results

        foods = FoodFacade.new(params).food_search
        @food1 = foods.first
        @food10 = foods.last

        visit root_path
        fill_in :q, with: 'sweet potatoes'
        click_button "Search"
      end

      it 'I see a total number of items returned by the search' do
        within 'section#food_results' do
          within 'div#total_results' do
            expect(page).to have_content("Total Results: #{@total_results}")
          end   
        end
      end

      it 'I see a list of ten foods that contain sweet potatoes' do
        within 'section#food_results' do
          expect(page).to have_css('tr.food', count: 10)
        end
      end

      it 'For each food, I see the GTIN/UPC Code, description, brand owner, and ingredients' do
        within 'section#food_results' do
          within first'tr.food' do
            expect(page).to have_content(@food1.code)
            expect(page).to have_content(@food1.description)
            expect(page).to have_content(@food1.brand_owner)
            expect(page).to have_content(@food1.ingredients)
          end

          within all('tr.food').last do
            expect(page).to have_content(@food10.code)
            expect(page).to have_content(@food10.description)
            expect(page).to have_content(@food10.brand_owner)
            expect(page).to have_content(@food10.ingredients)
          end
        end
      end
    end
  end
end