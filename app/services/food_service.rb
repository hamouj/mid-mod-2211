class FoodService
  def search_foods(keyword)
    get_url("/fdc/v1/foods/search?query=#{keyword}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def conn
    Faraday.new(url: 'https://api.nal.usda.gov') do |faraday|
      faraday.headers['X-Api-Key'] = ENV['food_api_key']
    end
  end
end