class AddNotesToResources < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :notes, :text
  end
end
