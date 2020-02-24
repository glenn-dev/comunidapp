json.extract! expenses_detail, :id, :amount, :concept_id, :created_at, :updated_at
json.url expenses_detail_url(expenses_detail, format: :json)
