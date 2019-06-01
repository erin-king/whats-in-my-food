class UsdaService
  def get_foods(criteria)
    conn = Faraday.new("https://api.nal.usda.gov/ndb/search/") do |f|
      f.params['api_key'] = ENV['food_key']
      f.adapter Faraday.default_adapter
    end
    response = conn.get("?format=json&q=#{criteria}&sort=n&max=10&offset=0")
    food_results = JSON.parse(response.body, symbolize_names: true)[:list]
  end


end
