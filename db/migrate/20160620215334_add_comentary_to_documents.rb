class AddComentaryToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :comentary, :text
  end
end
