json.extract! bill, :id, :num_bill, :total, :issue_date, :status, :bill_doc, :paid_doc, :expenses_detail_id, :department_id, :created_at, :updated_at
json.url bill_url(bill, format: :json)
