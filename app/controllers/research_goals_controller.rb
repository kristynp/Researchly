class ResearchGoalsController < ApplicationController 
  
  def new 
    @research_goal = ResearchGoal.new 
  end

  def create
    binding.pry 
  end

  private 

  def research_goal_params
    params.require(:research_goal).permit(:name, :description) 
  end

end