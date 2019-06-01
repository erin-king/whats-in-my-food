class SearchFacade
  def initialize(criteria)
    @criteria = criteria
  end

  def foods
    conn = Faraday.new("https://api.nal.usda.gov/ndb/search/") do |f|
      f.params['api_key'] = ENV['food_key']
      f.adapter Faraday.default_adapter
    end
    response = conn.get("?format=json&q=sweet potatoes&sort=n&max=10&offset=0")
    food_results = JSON.parse(response.body, symbolize_names: true)[:list]
    food_results[:item].map do |food_data|
      Food.new(food_data)
    end
  end

  def food_count
    "#{food_results[:total]} Items"
  end
end
