class ChangeDocumentToSti < ActiveRecord::Migration
  def change
    rename_column :documents, :certificate, :type
  end
end
