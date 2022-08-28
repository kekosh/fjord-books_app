json.extract! report, :id, :title, :content, :references, :created_at, :updated_at
json.url report_url(report, format: :json)
