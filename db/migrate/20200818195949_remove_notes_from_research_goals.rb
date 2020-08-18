class RemoveNotesFromResearchGoals < ActiveRecord::Migration[6.0]
  def change
    remove_column :research_goals, :notes
  end
end
