class Booking
  include Dist

  attr_accessor :sx, :sy, :dx, :dy, :driver, :customer, :fare, :car_type, :hash1

  def initialize(elem)
    @customer = elem
  end

  def books(micro, mini, prime, suv)
    puts "Choose the type of car \n1.Micro 2.Mini 3.Prime 4.SUV"
    @car_type = gets.chomp.to_i
    puts "\nEnter 1.To use current location 2.To enter source location : "
    choice = gets.chomp.to_i
    if choice == 1
      @sx = customer.x[0].to_i
      @sy = customer.x[2].to_i
    elsif choice ==2
      puts 'Enter source co-ordinate'
      @sx = gets.chomp.to_i
      @sy = gets.chomp.to_i
    end
    puts 'Enter destination co-ordinates'
    @dx = gets.chomp.to_i
    @dy = gets.chomp.to_i
    @fare = Dist.dist(@sx, @sy, @dx, @dy) * (10 + @car_type).to_f
    if @car_type == 1
      @hash1 = micro
    elsif @car_type == 2
      @hash1 = mini
    elsif @car_type == 3
      @hash1 = prime
    elsif @car_type == 4
      @hash1 = suv
    end
    puts '------------------------------------------------------------'
    puts "Journey details : \nSource co-ordinates : #{@sx},#{@sy} \nDestination co-ordinates : #{@dx},#{@dy}\n"
    puts "Fare : #{@fare}\n"

    min = 9999
    final = ''
    hash1.each do |item, _value|
      s = Dist.dist(@sx, @sy, item[0].to_i, item[2].to_i)
      if s < min
        min = s
        final = item
      end
    end
    puts "\n\nDriver details:"
    @driver = hash1[final]
    @driver.display
    [@car_type, final]
    puts '------------------------------------------------------------'
    puts '------------------------------------------------------------'
  end
end
