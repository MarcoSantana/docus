class RenameIssuesDocuments < ActiveRecord::Migration
  def change
    rename_table :issues_documents, :documents_issuers
  end
end
