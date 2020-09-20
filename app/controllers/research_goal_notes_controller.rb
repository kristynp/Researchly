class ResearchGoalNotesController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :set_research_goal, except: [:index, :new]

  def new
    if params[:research_goal_id] && @research_goal = ResearchGoal.find_by_id(params[:research_goal_id]) 
      @research_goal = ResearchGoal.find_by_id(params[:research_goal_id]) 
      @research_goal_note = @research_goal.research_goal_notes.build
    else
      @error = "That research goal does not exist" if params[:research_goal_id]
      @research_goal_note = ResearchGoalNote.new
    end 
  end

  def create
    if @research_goal  
      @research_goal_note = @research_goal.research_goal_notes.build(research_goal_note_params)
    else
      @error = "Please create a new research goal note from the research goal page it will be added to."
      redirect_to research_goals_path
    end
    if @research_goal_note.save
      redirect_to research_goal_path(@research_goal)
    else
      render :new
    end 
  end

  def edit
    @research_goal_note = ResearchGoalNote.find_by(id: params[:id])
  end

  def update
    @research_goal_note = ResearchGoalNote.find_by(id: params[:id])
    if @research_goal_note.update(research_goal_note_params)
      redirect_to @research_goal
    else 
      render :edit 
    end
  end

  def destroy
    @research_goal_note = ResearchGoalNote.find_by(id: params[:id])
    if @research_goal_note 
      @research_goal_note.destroy
    else
      @error = "Note not found"
    end
    redirect_to research_goal_path(@research_goal)
  end

  private 

  def set_research_goal 
    @research_goal = ResearchGoal.find_by(id: params[:research_goal_id])
  end
  
  def research_goal_note_params
    params.require(:research_goal_note).permit(:title, :content, :research_goal_id) 
  end

end
