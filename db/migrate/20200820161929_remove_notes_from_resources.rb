class RemoveNotesFromResources < ActiveRecord::Migration[6.0]
  def change
    remove_column :resources, :notes
  end
end
