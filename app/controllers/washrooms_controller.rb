class WashroomsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_washroom, only: [ :edit, :destroy, :update]


  def index
    @washrooms = Washroom.all
  end

  def new
    @washroom = Washroom.new
  end

  def create
    @washroom      = Washroom.new(washroom_attributes)
    @washroom.user = current_user
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

  def edit
  end

  def update
    if @washroom.update_attributes(washroom_attributes)
      redirect_to @washroom, notice: "Washroom updated!"
    else
      flash.now[:alert] = "Couldn't update!"
      render :edit
    end
  end

  def destroy
    if @washroom.destroy
      redirect_to washrooms_path, notice: "Washroom listing deleted!"
    else
      redirect_to washrooms_path, notice: "Couldn't delete listing"
    end
  end


  def washroom_attributes
    params.require(:washroom).permit([:name, :address, {person_ids: []}])
    end

  def find_washroom
    @washroom = current_user.washrooms.find_by_id(params[:id])
    redirect_to root_path, alert: "Access Denied" unless @washroom
  end

end
