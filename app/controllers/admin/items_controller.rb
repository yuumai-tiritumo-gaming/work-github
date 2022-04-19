class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genre = Genre.all
  end

  def index
    @items = Item.all
    
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.permit(:genre_id, :name, :body, :non_tax_price, :is_selling, :item_image)
  end

end
