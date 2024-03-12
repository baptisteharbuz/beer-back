class CountriesController < ApplicationController
    before_action :set_country, only: %i[ show edit ]

def index
    @countries = Country.order(:name)
    render json: @countries
end

def show
    @country = set_country
    render json: @country
end

def new
    @country = Country.new
    render json: @country
end

def edit
end

private

def set_country
    @country = Country.find(params[:id])
end

def country_params
    params.require(:country).permit(:name)
end

end