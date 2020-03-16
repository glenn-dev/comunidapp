json.extract! general_expense, :id, :amount, :status, :concept_id, :building_id, :created_at, :updated_at
json.url general_expense_url(general_expense, format: :json)
