class UsdaService
  def get_foods(criteria)
    get_json("?format=json&q=#{criteria}&sort=n&max=10&offset=0")
  end

  private

  def conn
    Faraday.new("https://api.nal.usda.gov/ndb/search/") do |f|
      f.params['api_key'] = ENV['food_key']
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:list]
  end
end
