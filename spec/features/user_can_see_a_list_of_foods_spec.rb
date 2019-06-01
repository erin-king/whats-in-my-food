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
    # within ".food-count" do
    #   expect(page).to have_content('531 Items')
    # end
    # Then I should see a list of ten foods sorted by relevance.
    expect(page).to have_css('.result', count: 10)
    within(first(".result")) do
      expect(page).to have_content("NDB Number")
      expect(page).to have_content("Name")
      expect(page).to have_content("Group")
      expect(page).to have_content("Data Source")
      expect(page).to have_content("Manufacturer")
    end
  end
end
