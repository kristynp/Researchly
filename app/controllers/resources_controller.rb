class ResourcesController < ApplicationController
  before_action :redirect_if_not_logged_in 

  def index
    if params[:research_goal_id] && @research_goal = ResearchGoal.find_by_id(params[:research_goal_id]) 
      #if it's nested and we find the post
      @resources = @research_goal.resources
    else
      @error = "That research goal does not exist" if params[:research_goal_id]
      binding.pry
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
    @resource = @research_goal.resources.build(resource_params)
    if @resource.save
      redirect_to resources_path 
    else
      render :new
    end 
  end

  def show
    @resource = Resource.find_by(id: params[:id]) 
  end

  def edit
    @resource = Resource.find_by(id: params[:id]) 
  end

  private 
  
  def resource_params
    params.require(:resource).permit(:title, :key_topics, :research_goal_id) 
  end

end