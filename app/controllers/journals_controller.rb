class JournalsController < ApplicationController

  def index
    #@journals = Journal.all
    @journals = Journal.all.most_resources 

  end

  def new 
    @journal = Journal.new
  end

end
