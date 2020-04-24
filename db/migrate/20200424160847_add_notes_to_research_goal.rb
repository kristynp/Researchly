class AddNotesToResearchGoal < ActiveRecord::Migration[6.0]
  def change
    add_column :research_goals, :notes, :text
  end
end
