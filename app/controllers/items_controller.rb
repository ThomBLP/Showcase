class ItemsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @item = Item.new
  end

  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.build(item_params)

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


def item_params
  params.require(:item).permit(:name, :description, :photo)
end
