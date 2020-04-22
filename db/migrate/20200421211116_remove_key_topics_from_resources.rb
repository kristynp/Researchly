class RemoveKeyTopicsFromResources < ActiveRecord::Migration[6.0]
  def change
    remove_column :resources, :key_topics
  end
end
