class Admin::GenresController < ApplicationController
  before_action :valid_admin?
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      @genre     = Genre.new
      @genres    = Genre.all
      respond_to do |format|
       format.html { redirect_to request.referer }
       format.js
      end
    else
      @genres = Genre.all
      flash.now[:alert] = "ジャンル名を入力してください"
      respond_to do |format|
       format.html { render "index" }
       format.js
      end
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
