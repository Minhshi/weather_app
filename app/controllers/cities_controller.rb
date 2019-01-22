class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @cities = City.all
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

  private

  def city_params
    params.require(:city).permit(:name)
  end
end
