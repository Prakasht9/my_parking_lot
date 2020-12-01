class ParkingSpace < ApplicationRecord
  before_create :add_spot_number
  
  scope :parked,-> { where.not(vehicle_number: "", parking_number: "")}
  scope :available_parking_space,-> { where(vehicle_number: "", parking_number: "")}

  def vehicle_type
    self.class.name.underscore.humanize.split(" ").first
  end

  private
  
  def add_spot_number
    self.spot_number = "#{(self.class.name)}_#{(self.class&.last&.id.to_i + 1)}"
  end
end