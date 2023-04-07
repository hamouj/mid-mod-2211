class FoodFacade
  attr_reader :query

  def initialize(params)
    @query = params[:q]
  end

  def service
    @_service ||= FoodService.new
  end

  def json
    @_json ||= service.food_search(@query)
  end

  def food_search
    json[:foods].map do |food_data|
      Food.new(food_data)
    end.first(10)
  end

  def total_results
    json[:totalHits]
  end
end