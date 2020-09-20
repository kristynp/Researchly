class JournalsController < ApplicationController
  before_action :set_journal, only: [:edit, :update, :show, :destroy]

  def index
    @journals = Journal.all.most_resources
  end

  def show 
    redirect_to journals_path if !@journal
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
    @current_user = current_user
  end

  def update
    if @journal.update(journal_params)
      redirect_to journals_path
    else
      render :edit
    end
  end

  def destroy
    if @journal 
      @journal.destroy 
    else
      @error = "Journal not found and not destroyed"
    end
    redirect_to journals_path()
  end 

  private 

  def set_journal
    @journal = Journal.find_by(id: params[:id])
  end
  
  def journal_params
    params.require(:journal).permit(:name, :website, :open_source)
  end

end
