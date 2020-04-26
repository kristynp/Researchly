class ResearchGoalsController < ApplicationController 
  
  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @research_goals = @user.research_goals.most_resources
    else
      @error = "That user doesn't exist." if params[:user_id] 
      @research_goals = ResearchGoal.most_resources 
    end
  end
  
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

  def show 
    @research_goal = ResearchGoal.find_by_id(params[:id])
    redirect_to research_goals_path if !@research_goal
  end

  def edit
    @research_goal = ResearchGoal.find_by(id: params[:id])
    @current_user = current_user
  end

  def update
    @research_goal = ResearchGoal.find_by(id: params[:id])
    if @research_goal.update(research_goal_params)
      redirect_to @research_goal
    else
      render :edit
    end
  end

  private 

  def research_goal_params
    params.require(:research_goal).permit(:name, :description, :notes) 
  end

end