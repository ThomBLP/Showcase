class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.category_id = params[:category_id]
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash.notice = "Nouvel item crée!"
      redirect_to category_path(@item.category)
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
    @category = Category.find(params[:category_id])
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    redirect_to root_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to category_path(@item.category)
  end
end

private

def item_params
  params.require(:item).permit(:name, :description, :category_id, :id, photo: [])
end
