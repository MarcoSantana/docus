json.array!(@personal_documents) do |personal_document|
  json.extract! personal_document, :id
  json.url personal_document_url(personal_document, format: :json)
end
