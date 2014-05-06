class WashroomsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @washrooms = Washroom.all
  end

  def new
    @washroom = Washroom.new
  end

  def create
    @washroom = Washroom.new(washroom_attributes)
    if @washroom.save
      redirect_to washrooms_path, notice: "Your washroom listing was created!"
    else
      flash.now[:alert] = "This form still needs some work"
      render :new
    end
  end

  def show
    @washroom = Washroom.find(params[:id])
  end

  def update
  end

  def destroy
    if @washroom.destroy
      redirect_to washrooms_path, notice: "Washroom listing deleted!"
    else
      redirect_to washrooms_path, notice: "Couldn't delete listing"
    end
  end


  def washroom_attributes
    params.require(:washroom).permit([:name, :address])
  end
end
