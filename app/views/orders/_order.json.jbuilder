json.extract! order, :id, :user_id, :status, :delivery, :created_at, :updated_at
json.url order_url(order, format: :json)
