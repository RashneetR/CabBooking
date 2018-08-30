require './Person.rb'
require './Customer.rb'
require './Driver.rb'
require './Car.rb'
require './Booking.rb'
require './System.rb'
#require './Mod.rb'

class Sample
  attr_accessor :flag

  def initialize
    @flag = 0
  end

  def function1
    loop do
      puts "\nMAIN MENU : \n"
      puts '------------------------------------------------------------'
      puts "1.Add new driver (7 steps) \n2.Add new customer (4 steps)\n3.Book Ride \n4.Exit \nEnter your choice : "
      flag = gets.chomp.to_i
      puts '------------------------------------------------------------'
      break if flag < 1 || flag >= 4
      s = System.new
      if flag == 1
        s.add_driver
      elsif flag == 2
        s.add_customer
      elsif flag == 3
        s.book
      end
    end
  end
end

Sample.new.function1
