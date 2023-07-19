class CategoriesController < ApplicationController
  before_action :authorize!
  def index  
#   @categories = Category.all.order(name: :asc)
    @categories = Category.all.order(id: :asc)
  end

  def new
    @category = Category.new
  end

  def edit
    category
  end

  def create
    @category = Category.new(category_params)

    if @category.save
        redirect_to categories_url, notice: "Categoria creada."
    else
        render :new, status: :unprocessable_entity
    end

  end

  def update
    if category.update(category_params)      
      redirect_to categories_url, notice: "Categoria actualizada." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    category.destroy
    redirect_to categories_url, notice: "Categoria eliminada."
  end

  private
    def category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end

end
