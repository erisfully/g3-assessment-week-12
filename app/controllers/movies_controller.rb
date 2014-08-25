class MoviesController < ApplicationController

  def index
    @movies = Movie.all.order(:year).reverse_order
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(
      name: params[:movie][:name],
      year: params[:movie][:year],
      synopsis: params[:movie][:synopsis]
    )

    if @movie.save
      redirect_to root_path
    else
      render 'new'
    end
  end
end