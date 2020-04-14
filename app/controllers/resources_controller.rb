class ResourcesController < ApplicationController
  before_action :redirect_if_not_logged_in 

  def index
    if params[:research_goal_id] && @research_goal = ResearchGoal.find_by_id(params[:research_goal_id]) 
      @resources = @research_goal.resources
    else
      flash[:message] = "That research goal does not exist"
      @resources = Resource.all
    end
  end

  def new 
    @resource = Resource.new 
  end

  def create
    @resource = current_user.research_goal.resources.build(resource_params)
    if @resource.save
      redirect_to resources_path 
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
    params.require(:resource).permit(:title, :key_topics) 
  end

end