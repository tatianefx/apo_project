class QuestionsController < ApplicationController
  
  def index
  	@questions = Question.all
 
    respond_to do |format|
      format.html  # index.html.erb
    end
  end
end
