class DoorsController < ApplicationController
	before_action :find_location, except: [:index, :show]
  before_action :find_door, only: [:create, :update, :destroy]

  def new
    @door = Door.new
  end

  def edit
    @door = Door.find(params[:id])
  end

  def update
    if @door.update(doors_params)
      redirect_to admin_location_path(@location), notice: 'Door was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @door = Door.new(doors_params.merge(location_id: @location.id))

    if @door.save
      redirect_to admin_location_path(@location), notice: 'Door was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @door.destroy
    flash[:notice] = 'Door was successfully deleted'
    redirect_to admin_location_path(@location)
  end

  private

  def doors_params
    params.require(:door).permit(:location_id, :is_external, :flow_to, :flow_from, :sensor_id)
    # need to add sensor_id and cusotmize model has many for vusomt sql
  end


  def find_door
    @door = Door.find(params[:id])
  end

  def find_location
    @alocation = Location.find(params[:location_id])
  end
end
