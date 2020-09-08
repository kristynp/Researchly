class ResourcesController < ApplicationController
  before_action :redirect_if_not_logged_in 

  def index
    if params[:research_goal_id] && @research_goal = ResearchGoal.find_by_id(params[:research_goal_id]) 
      #if it's nested and the research goal is found
      @resources = @research_goal.resources
    else
      @error = "That research goal does not exist" if params[:research_goal_id]
      @resources = Resource.all
    end
  end

  def new
    if params[:research_goal_id] && @research_goal = ResearchGoal.find_by_id(params[:research_goal_id]) 
      @research_goal = ResearchGoal.find_by_id(params[:research_goal_id]) 
      @resource = @research_goal.resources.build
    else
      @error = "That research goal does not exist" if params[:research_goal_id]
      @resource = Resource.new
    end 
  end

  def create
    @research_goal = ResearchGoal.find_by_id(params[:research_goal_id])
    if @research_goal  
      @resource = @research_goal.resources.build(resource_params)
    else
      @error = "Please create a new resource from the research goal it will be added to."
      redirect_to research_goals_path
    end
    if @resource.save
      redirect_to research_goal_resources_path(@research_goal) 
    else
      render :new
    end 
  end

  def show
    @resource = Resource.find_by(id: params[:id]) 
  end

  def edit
    @resource = Resource.find_by(id: params[:id])
    @current_user = current_user
  end

  def update
    @resource = Resource.find_by(id: params[:id])
    if @resource.update(resource_params)
      redirect_to @resource
    else 
      render :edit 
    end
  end

  private 
  
  def resource_params
    params.require(:resource).permit(:title, :key_topics, :research_goal_id, :journal_id, :website, :notes) 
  end

end
