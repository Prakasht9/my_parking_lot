class ParkingSpacesController < ApplicationController
  before_action :find_my_vehical, only: [:find_vehical, :unpark]

  def index
    @parking_spaces = ParkingSpace.all.order(spot_number: :desc).paginate(page: params[:page], per_page: 10)
  end

  def free_parking_space
    @parking_spaces = ParkingSpace.available_parking_space.order(spot_number: :desc).paginate(page: params[:page], per_page: 10)
  end

  def new
    @parking_space = ParkingSpace.new()
  end

  def create
    @parking_space = ParkingSpace.find_by(spot_number: params[:spot_number])
    if @parking_space.update(parking_params)
      flash.now[:success] = "Vehicle Parked"
      redirect_to parking_spaces_path
    else
      render :new
    end
  end

  def unpark_form
  end

  def unpark
    respond_to do |format|
      if @parking_space.present?
        @parking_space.update(parking_number: "", vehicle_number: "")
        format.html { redirect_to parking_spaces_path, notice: 'Post was successfully updated.' }
      else
        format.html { render parking_spaces_unpark_form_path, flash: { notice: 'Could not find the vehicle.' }}
      end
    end     
  end
  
  def find_vehical_form
  end

  def find_vehical
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def render_available_space_type
    @space = ParkingSpace.available_parking_space.where(type: "#{params[:type]}Space").pluck(:id, :spot_number)
    render json: {
      data: @space.map { |key, val|
        [ text: val, value: key ]
      }
    }
  end

  def set_space
    @parking_space = ParkingSpace.find_by(id: params[:id])
  end

  def parking_params
    params.require(:parking_space).permit( :parking_number, :vehicle_number )
  end

  def find_my_vehical
    action = params[:action].to_sym
    parking_number = params[action][:parking_number]
    vehicle_number = params[action][:vehicle_number]
    @parking_space = ParkingSpace.parked.where('parking_number=? OR vehicle_number=?', parking_number , vehicle_number).first
  end
end
