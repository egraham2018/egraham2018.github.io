json.extract! event, :id, :name, :description, :occuring, :created_at, :updated_at
json.url event_url(event, format: :json)
