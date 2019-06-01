class SearchFacade
  def initialize(criteria)
    @criteria = criteria
  end

  def foods
    food_results[:item].map do |food_data|
      Food.new(food_data)
    end
  end

  def food_count
    "#{foods.count} Items"
  end

  private

  def service
    @_service ||= UsdaService.new
  end

  def food_results
    @_food_results ||= service.get_foods(@criteria)
  end

end
# DON'T FORGET FOOD_COUNT!!! AND TEST LINE 14-16
