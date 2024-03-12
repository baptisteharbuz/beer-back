class BarsController < ApplicationController
    before_action :set_bar, only: %i[ show edit ]

    def index
        @bars = Bar.all
        render json: @bars
    end
    
    def show
        @bar = set_bar
        render json: @bar
    end
    
    def new
        @bar = Bar.new
        render json: @bar
    end
    
    def edit
    end
    
    private
    
    def set_bar
        @bar = Bar.find(params[:id])
    end
    
    def bar_params
        params.require(:bar).permit(:name)
    end
end
