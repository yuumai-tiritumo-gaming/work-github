class Public::ItemsController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.order(created_at: :desc).limit(4) 
  end

  def about
  end

  def index
    @genres = Genre.all
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
  end
end
