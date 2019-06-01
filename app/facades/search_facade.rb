class SearchFacade
  def initialize(criteria)
    @criteria = criteria
  end

  def foods
    service = UsdaService.new
    food_results = service.get_foods(@criteria)

    food_results[:item].map do |food_data|
      Food.new(food_data)
    end
    #
    # conn = Faraday.new("https://api.nal.usda.gov/ndb/search/") do |f|
    #   f.params['api_key'] = ENV['food_key']
    #   f.adapter Faraday.default_adapter
    # end
    # response = conn.get("?format=json&q=sweet potatoes&sort=n&max=10&offset=0")
    # food_results = JSON.parse(response.body, symbolize_names: true)[:list]
    # food_results[:item].map do |food_data|
    #   Food.new(food_data)
    # end
  end

  def food_count
    "#{foods.count} Items"
  end
end
# DON'T FORGET FOOD_COUNT!!! AND TEST LINE 14-16
