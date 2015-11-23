class AnswersController < ApplicationController

  def index
  	@answers = Answer.all
 
    respond_to do |format|
      format.html  # index.html.erb
    end
  end

  def graph
  	
  end
  
end
