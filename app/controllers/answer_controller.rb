class AnswerController < ApplicationController
	def create
  	@answer = Answer.new(answer_params)

  	if @answer.save
  		redirect_to action: :index
  	else
  		render :new
  	end
  end

  def index
  	@answers = Answer.all
 
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @posts }
    end
  end

  def new
  	@answer = Answer.new
  end

  private

  def answer_params
  	params.require(:answer).permit(:resident_id, :question_id, :text_, :apo_id, :room_id, :concept_id, :attribute_id, :synchronized)
  end
end
