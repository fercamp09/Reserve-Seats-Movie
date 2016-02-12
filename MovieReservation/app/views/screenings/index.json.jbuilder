json.array!(@screenings) do |screening|
  json.extract! screening, :id
  json.url screening_url(screening, format: :json)
end
