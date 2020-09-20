class ResearchGoalsController < ApplicationController 
  before_action :set_research_goal, only: [:show, :edit, :update, :destroy]
  
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
    redirect_to research_goals_path if !@research_goal
  end

  def edit
    @current_user = current_user
  end

  def update
    if @research_goal.update(research_goal_params)
      redirect_to @research_goal
    else
      render :edit
    end
  end

  def destroy
    @research_goal.resources.each do |resource| 
      resource.destroy
    end
    @research_goal.destroy 
    redirect_to research_goals_path  
  end

  private 

  def set_research_goal
    @research_goal = ResearchGoal.find_by(id: params[:id])
  end

  def research_goal_params
    params.require(:research_goal).permit(:name, :description, :notes) 
  end

end