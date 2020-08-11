class JournalsController < ApplicationController

  def index
    @journals = Journal.all.most_resources
  end

  def new 
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(journal_params)
    if @journal.save
      redirect_to journals_path
    else
      render :new
    end
  end

  def edit
    @journal = Journal.find_by(id: params[:id])
    @current_user = current_user
  end

  def update
    @journal = Journal.find_by(id: params[:id])
    if @journal.update(journal_params)
      redirect_to journals_path
    else
      render :edit
    end
  end

  def show
    @journal = Journal.find_by(id: params[:id]) 
  end

  private 
  
  def journal_params
    params.require(:journal).permit(:name, :website, :open_source)
  end

end
