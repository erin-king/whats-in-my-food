require 'rails_helper'

describe 'As a user' do
  it 'shows a list of relevant foods' do
    # When I visit "/"
    visit '/'
    # And I fill in the search form with "sweet potatoes"
    fill_in :q, with: 'sweet potatoes'
    # And I click "Search"
    click_on 'Search'
    # Then I should be on page "/foods"
    expect(current_path).to eq('/foods')
    # Then I should see a total of the number of items returned by the search. (531 for sweet potatoes)
    expect(page).to have_content('531')
    # Then I should see a list of ten foods sorted by relevance.
    expect(page).to have_css('.food-results', count: 10)
  end
end


# And for each of the foods I should see:
# - The food's NDB Number
# - The food's name
# - The food group to which the food belongs
# - The food's data source
# - The food's manufacturer
