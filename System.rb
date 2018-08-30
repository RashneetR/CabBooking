class System
  @@free_customer = []
  @@booking = []
  @@driver = []
  @@micro_driver = {}
  @@mini_driver = {}
  @@prime_driver = {}
  @@suv_driver = {}

  def add_customer
    puts "Customer Details\n"
    puts '------------------------------------------------------------'
    puts "Step 1 : Enter your id"
    id = gets.chomp.to_i
    puts '------------------------------------------------------------'
    puts "Step 2 : Enter your name"
    name = gets.chomp
    puts '------------------------------------------------------------'
    puts "Step 3 : Enter the your number"
    num = gets.chomp
    puts '------------------------------------------------------------'
    puts "Step 4 : Enter your location co-ordinates (x,y)"
    *loc = gets.chomp
    puts '------------------------------------------------------------'
    temp = Customer.new(id, name, num, *loc)
    @@free_customer << temp
    puts "\tCustomer Details successfully entered!"
    puts '------------------------------------------------------------'
    puts '------------------------------------------------------------'
    temp.display
    puts '------------------------------------------------------------'
    puts '------------------------------------------------------------'
  end

  def add_driver
    puts "Driver Details\n"
    puts '------------------------------------------------------------'
    puts "Step 1 : Enter the id"
    id = gets.chomp.to_i
    puts '------------------------------------------------------------'
    puts "Step 2 : Enter the name"
    name = gets.chomp
    puts '------------------------------------------------------------'
    puts "Step 3 : Enter the contact number"
    num = gets.chomp
    puts '------------------------------------------------------------'
    puts "Step 4 : Enter the location co-ordinates(x,y)"
    *loc = gets.chomp
    puts '------------------------------------------------------------'
    puts "Step 5 : Enter the type of car(1.Micro 2.Mini 3.Prime 4.SUV)"
    type = gets.chomp.to_i
    puts '------------------------------------------------------------'
    puts "Step 6 : Enter the registration number"
    reg_no = gets.chomp
    puts '------------------------------------------------------------'
    puts "Step 7 : Enter the color"
    color = gets.chomp
    puts '------------------------------------------------------------'
    temp_car =  Car.new(type, reg_no, color)
    temp = Driver.new(id, name, num, *loc, temp_car)
    @@driver << temp
    puts "\tDriver Details successfully entered!"
    temp_car.display_car_details
    puts '------------------------------------------------------------'
    puts '------------------------------------------------------------'
    if type == 1
      @@micro_driver[*loc] = temp
    elsif type == 2
      @@mini_driver[*loc] = temp
    elsif type == 3
      @@prime_driver[*loc] = temp
    elsif type == 4
      @@suv_driver[*loc] = temp
    end
  end

  def book
    #cust = ""
    puts "Enter the customer id"
    customer_id = gets.chomp.to_i
    flag = 0
    @@free_customer.each do |elem|
      if customer_id == elem.id
        b = Booking.new(elem)
        *return_value = b.books(@@micro_driver, @@mini_driver, @@prime_driver, @@suv_driver)
        @@booking[b.object_id] = b.driver
        flag = 1
        if return_value[0] == 1
          @@micro_driver.delete(return_value[1])
        elsif return_value[0] == 2
          @@mini_driver.delete(return_value[1])
        elsif return_value[0] == 2
          @@prime_driver.delete(return_value[1])
        elsif return_value[0] == 2
          @@suv_driver.delete(return_value[1])
        end
        break
      end
    end
    if flag == 0 
      puts "Customer ID is not registered"
    end
  end
end

