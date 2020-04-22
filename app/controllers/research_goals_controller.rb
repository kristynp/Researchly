class ResearchGoalsController < ApplicationController 
  
  def new 
    @research_goal = ResearchGoal.new 
  end

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @research_goals = @user.research_goals.most_resources
    else
      @error = "That user doesn't exist." if params[:user_id] 
      @research_goals = ResearchGoal.most_resources 
    end
  end

  def show 
    @research_goal = ResearchGoal.find_by_id(params[:id])
    redirect_to research_goals_path if !@research_goal
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