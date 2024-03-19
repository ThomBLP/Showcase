class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash.notice = "Nouvelle catégorie créee!"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to home_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to home_path
  end

private

  def category_params
    params.require(:category).permit(:name, :description, :photo, :id)
  end
end
