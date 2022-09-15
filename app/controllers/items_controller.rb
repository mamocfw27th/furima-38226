class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_new, only: :edit

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path

    else
      render :new
    end
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
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :area_id, :postage_id, :arrival_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def move_to_new
    redirect_to action: :index unless current_user == @item_user
  end
end
