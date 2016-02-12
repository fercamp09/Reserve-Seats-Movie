json.array!(@seats) do |seat|
  json.extract! seat, :id, :row, :column
  json.url seat_url(seat, format: :json)
end
