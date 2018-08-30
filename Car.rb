class Car
  @@num_of_car = 0
  attr_accessor :car_id, :ctype, :vehicle_no, :color

  def initialize(type, vehicle_no, color)
    @car_id = @@num_of_car + 1
    @type = type
    @vehicle_no = vehicle_no
    @color = color
  end

  def display_car_details
    puts "Car Id : #{@car_id} \nVehicle Number : #{@vehicle_no}\nColor : #{@color}"
  end
end
