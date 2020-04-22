class AddKeyTopicsToResources < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :key_topics, :string
  end
end

