class ItemsController < ApplicationController
  before_action :find_category, only: [:new, :create]
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash.notice = "Nouvel item crée!"
      redirect_to category_path(@category)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to home_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to home_path
  end
end

private

def find_category
  @category = Category.find(params[:category_id])
end
def item_params
  params.require(:item).permit(:name, :description, :photo, :category_id)
end
