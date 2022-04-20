class Public::ItemsController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.order(created_at: :desc).limit(4)
  end

  def about
  end

  def index
  end

  def show
  end
end
