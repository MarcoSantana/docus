class IssuesDocuments < ActiveRecord::Migration
  def change
    create_table :issues_documents do |t|
      t.integer :document_id
      t.integer :issuer_id
    end
    add_index :issues_documents, :document_id
    add_index :issues_documents, :issuer_id

  end
end
