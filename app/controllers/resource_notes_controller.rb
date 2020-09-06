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

  def edit
    @resource = Resource.find_by(id: params[:resource_id])
    @resource_note = ResourceNote.find_by(id: params[:id])
  end

  def update
    @resource = Resource.find_by(id: params[:resource_id])
    @resource_note = ResourceNote.find_by(id: params[:id])

    if @resource_note.update(resource_note_params)
      redirect_to @resource
    else 
      render :edit 
    end
  end

  def destroy
    @resource = Resource.find_by(id: params[:id]) 
    @resource_note = ResourceNote.find_by(id: params[:format]) #why is this under format in params?

    if @resource_note 
      @resource_note.destroy
    else
      @error = "Resource not found"
    end

    redirect_to resource_path(@resource)
  end

  

  private 
  
  def resource_note_params
    params.require(:resource_note).permit(:title, :content, :resource_id) 
  end
end
