class ResearchGoalsController < ApplicationController 
  
  def new 
    @research_goal = ResearchGoal.new 
  end

  def create
    @research_goal = current_user.research_goals.build(research_goal_params)
    if @research_goal.save 
      redirect_to research_goals_path
    else 
      render :new 
    end 
  end

  private 

  def research_goal_params
    params.require(:research_goal).permit(:name, :description) 
  end

end