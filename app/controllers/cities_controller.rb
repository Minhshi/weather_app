class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  def index
    @cities = City.all
  end

  def show
    @api = ENV["APIKEY"]
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to cities_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @city.update(city_params)
      redirect_to city_path(@city)
    else
      render :edit
    end
  end

  def destroy
    if @city.delete
      redirect_to cities_path
    end
  end

  private

  def city_params
    params.require(:city).permit(:name)
  end

  def set_city
    @city = City.find(params[:id])
  end

end
