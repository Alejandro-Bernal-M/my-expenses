json.extract! record, :id, :name, :author_id, :amount, :created_at, :updated_at
json.url record_url(record, format: :json)
