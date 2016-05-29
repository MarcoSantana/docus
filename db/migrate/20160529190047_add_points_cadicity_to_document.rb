class AddPointsCadicityToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :value, :integer, :default => 0
    add_column :documents, :caducity, :date, :default => nil
  end
end
