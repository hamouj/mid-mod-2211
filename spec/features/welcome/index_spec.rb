require 'rails_helper'

describe 'Welcome Page' do
  context 'As a user' do
    context 'When I visit / and fill in the search form with sweet potatoes and click search' do
      it 'redirects me to the page /foods' do
        visit root_path

        fill_in :q, with: 'sweet poatotes'
        click_button "Search"

        expect(current_path).to eq(foods_path)
      end
    end
  end
end