class ResourceNotesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    if params[:resource_id] && @resource = Resource.find_by_id(params[:resource_id]) 
      @resource = Resource.find_by_id(params[:resource_id]) 
      @resource_note = @resource.resource_notes.build
    else
      @error = "That resource does not exist" if params[:resource_id]
      @resource_note = ReseourceNote.new
    end 
  end

  def create
    @resource = Resource.find_by_id(params[:resource_id])
    if @resource  
      @resource_note = @resource.resource_notes.build(resource_note_params)
    else
      @error = "Please create a new resource note from the resource page it will be added to."
      redirect_to resources_path
    end
    if @resource_note.save
      redirect_to resource_path(@resource)
    else
      render :new
    end 
  end

  

  private 
  
  def resource_note_params
    params.require(:resource_note).permit(:title, :content, :resource_id) 
  end
end
