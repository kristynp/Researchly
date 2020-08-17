class ResearchGoalNotesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    if params[:research_goal_id] && @research_goal = ResearchGoal.find_by_id(params[:research_goal_id]) 
      @research_goal = ResearchGoal.find_by_id(params[:research_goal_id]) 
      #binding.pry
      @research_goal_note = @research_goal.research_goal_notes.build
    else
      @error = "That research goal does not exist" if params[:research_goal_id]
      @research_goal_note = ResearchGoalNote.new
    end 
  end

  def create
    @research_goal = ResearchGoal.find_by_id(params[:research_goal_id])
    if @research_goal  
      @research_goal_note = @research_goal.research_goal_notes.build(research_goal_note_params)
    else
      @error = "Please create a new research goal note from the research goal page it will be added to."
      redirect_to research_goals_path
    end
    if @research_goal_note.save
      redirect_to research_goal_path(@research_goal)
    else
      render :new
    end 
  end

  private 
  
  def research_goal_note_params
    params.require(:research_goal_note).permit(:title, :content, :research_goal_id) 
  end

end
