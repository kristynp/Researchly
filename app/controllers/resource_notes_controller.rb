class ResourceNotesController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :set_resource, only: [:create, :edit, :update]
  before_action :set_resource_note, only: [:edit, :update]

  def new
    if params[:resource_id] && set_resource 
      @resource_note = @resource.resource_notes.build
    else
      @error = "That resource does not exist" if params[:resource_id]
      @resource_note = ReseourceNote.new
    end 
  end

  def create
    if @resource  
      @resource_note = @resource.resource_notes.build(resource_note_params)
    else
      @error = "Please create a new resource note from the resource page it will be added to."
    end
    if @resource_note.save
      redirect_to resource_path(@resource)
    else
      render :new
    end 
  end

  def update
    if @resource_note.update(resource_note_params)
      redirect_to @resource
    else 
      render :edit 
    end
  end

  def destroy
    @resource = Resource.find_by(id: params[:id])
    @resource_note = ResourceNote.find_by(id: params[:format])
    if @resource_note 
      @resource_note.destroy
    else
      @error = "Resource not found"
    end
    redirect_to resource_path(@resource) 
  end


  private 
  
  def set_resource
    @resource = Resource.find_by(id: params[:resource_id])
  end

  def set_resource_note
    @resource_note = ResourceNote.find_by(id: params[:id])
  end
  
  def resource_note_params
    params.require(:resource_note).permit(:title, :content, :resource_id) 
  end
end
