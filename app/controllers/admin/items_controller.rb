class Admin::ItemsController < ApplicationController
  before_action :valid_admin?
  def new
    @item = Item.new
    @genre = Genre.all
  end

  def index
    @items = Item.page(params[:page])

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item), notice: "商品を追加しました"
    else
      @genre = Genre.all
      flash.now[:alert] = "全てのフォームに入力してください"
      render :new
    end

  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genre = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @genre = Genre.all
    if @item.update(item_params)
      redirect_to admin_item_path(@item), notice: "商品情報を更新しました"
    else
      flash.now[:alert] = "全てのフォームに入力してください"
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :body, :non_tax_price, :is_selling, :item_image)
  end

end
