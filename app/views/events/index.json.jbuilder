json.array!(@events) do |event|
  json.extract! event, :id, :title, :content, :date_from, :date_to
  json.url event_url(event, format: :json)
end
