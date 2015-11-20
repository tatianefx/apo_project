class CategoriesController < ApplicationController
  def create
  	@category = Category.new(category_params)

  	if @category.save
  		redirect_to action: :index
  	else
  		render :new
  	end
  end

  def index
  	@categories = Category.all
  end

  def new
  	@category = Category.new
  end

  private

  def category_params
  	params.require(:category).permit(:name)
  end
end
