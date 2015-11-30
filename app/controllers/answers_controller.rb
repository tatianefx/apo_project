class AnswersController < ApplicationController

  def index
  	@answers = Answer.all
 
    respond_to do |format|
      format.html  # index.html.erb
    end
  end

  def graph
  	
  end

  def data_count
  	@data_count = Answer.select('text_').where(:question_id => 814).group(:text_).count('text_')
  	
  	render :json => @data_count
  end

end