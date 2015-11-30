class AnswersController < ApplicationController

  def index
  	@answers = Answer.all
 
    respond_to do |format|
      format.html  # index.html.erb
    end
  end

  def graph
  	
  end

  def data_label
  	@data_label = Answer.select('text_').where(:question_id => 812).group(:text_).map(&:text_)

  	render :json => @data_label
  end

  def data_count
  	@data_count = Answer.select('text_').where(:question_id => 812).group(:text_).count('text_')
  	
  	render :json => @data_count
  end

end

=begin
	
  	respond_to do |format|
  		format.html
  		format.js
	    format.json {render json: @data_labels}
    end
	
=end