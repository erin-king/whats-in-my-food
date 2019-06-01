class SearchFacade
  def initialize(criteria)
    @criteria = criteria
  end

  def foods
    conn = Faraday.new("https://api.nal.usda.gov/ndb/search/") do |f|
      f.params['api_key'] = 'OlS2An2j82DKkWkfv4gVpg97Z7Jbg7S75c8u6Bex'
      f.adapter Faraday.default_adapter
    end
    response = conn.get("?format=json&q=sweet potatoes&sort=n&max=10&offset=0")
    food_results = JSON.parse(response.body, symbolize_name: true)

    food_results.map do |food_data|
      Food.new(food_data)
    end
  end

  def foods_count

  end
end
