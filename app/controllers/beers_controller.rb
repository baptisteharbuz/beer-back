class BeersController < ApplicationController
  before_action :set_beer, only: %i[ show edit update destroy ]

  # GET /beers or /beers.json
  def index
    @beers = Beer.all
    render json: @beers
  end

  # GET /beers/1 or /beers/1.json
  def show
    @beer = set_beer
    render json: @beer
  end

  # GET /beers/new
  def new
    @beer = Beer.new
    render json: @beer
  end

  # GET /beers/1/edit
  def edit
  end

  # POST /beers
  def create
  @beer = Beer.new(beer_params)

  if @beer.save
    update_beer_bars if params[:bars].present?
    render json: @beer, status: :created, location: @beer
  else
    render json: @beer.errors, status: :unprocessable_entity
  end
end

  # PATCH/PUT /beers/1 or /beers/1.json
  def update
    beer = Beer.find(params[:id])
    
    beer.bar_ids = params[:bars] if params[:bars].present?
    
    if beer.save
      render json: beer, status: :ok
    else
      render json: beer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /beers/1
  def destroy
    @beer.destroy
    head :no_content
  end

  private
    def set_beer
      @beer = Beer.find(params[:id])
    end

    def beer_params
      params.require(:beer).permit(:brand, :style, :quantity, :country_id)
    end
end
