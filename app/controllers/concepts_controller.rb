class ConceptsController < ApplicationController
  
  def index
  	@concepts = Concept.all
 
    respond_to do |format|
      format.html  # index.html.erb
    end
  end
end
