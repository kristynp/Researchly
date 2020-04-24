class AddWebsiteToResources < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :website, :string
  end
end
