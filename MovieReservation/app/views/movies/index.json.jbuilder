json.array!(@movies) do |movie|
  json.extract! movie, :id, :name, :image_url, :description
  json.url movie_url(movie, format: :json)
end
