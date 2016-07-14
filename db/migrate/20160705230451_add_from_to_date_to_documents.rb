class AddFromToDateToDocuments < ActiveRecord::Migration
  def change
    add_column 'documents', 'from', :date
    add_column 'documents', 'to', :date
  end
end
