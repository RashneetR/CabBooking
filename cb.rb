class Person
 attr_accessor :id, :name, :contactno, :x, :y

 def initialize(pid, pname, pcontactno, *plocation)
  @id = pid
  @name = pname
  @contactno = pcontactno
  @x = plocation[0]
  @y = plocation[1] 
 end
 def display
  puts "Name :"
  puts @name
  puts "Contact number"
  puts @contactno
 end
 
end

class Customer < Person

 def initialize(cid, cname, ccontactno, *clocation)
  super(cid,cname,ccontactno,*clocation)
 end
 def display
   super
 end

end

class Driver < Person
 @car
 
 def initialize(did, dname, dcontactno, *dlocation, car)
  super(did,dname,dcontactno,*dlocation)
  @car=car 
 end
 def display
   super
 end
end



class Car
 @@numofcar= 0
 attr_accessor :carid
 attr_accessor :type
 attr_accessor :vehicleno
 attr_accessor :color
 def initialize(type,vehicleno,color)
  @carid= @@numofcar+1
  @type=type
  @vehicleno=vehicleno
  @color=color
 end
 
end

class Booking
 attr_accessor :sx,:sy,:dx,:dy,:driver,:customer,:fare,:type1
 attr_accessor :hash1
 hash1 = {}


 def books(micro, mini, prime, suv)
  
  @bid = gets.chomp.to_i
  puts "Choose the type of car \n1.Micro 2.Mini 3.Prime 4.SUV"
  @type1= gets.chomp.to_i
  puts "Enter source co-ordinate"
  @sx=gets.chomp.to_i
  @sy=gets.chomp.to_i
  puts "Enter destination co-ordinates"
  @dx=gets.chomp.to_i
  @dy=gets.chomp.to_i
  *returnvalue ={}
  @fare =   (Math.sqrt(  ((@dx-@sx) ** 2)+((@dy-@sy) ** 2) )) * ((10 + @type1).to_f)
  
  
  
  if @type1==1
   @hash1=micro
   elsif @type1==2
   
    @hash1=mini
   elsif @type1==3
    
    @hash1=prime
   elsif @type1==4
   
    @hash1=suv
  end
  puts "The fare is #{@fare}"
  #puts hash1
  min = 9999
  final = ""

  hash1.each do |item,value|
    s = Math.sqrt ( (((item[0].to_i) - @sx) ** 2) + (( (item[2].to_i) - @sy)** 2))
    #puts s
    if s < min
      min = s
      final = item
    end
  end
  #puts "yay"
  puts " The driver details are : "
  @driver = hash1[final]
  @driver.display
 
  *returnvalue=[@type1,final]
  
  return *returnvalue
 end
 
end

class System
 @@freecustomer = []
 @@booking = []
 @@driver = []
 @@microdriver = {}
 @@minidriver = {}
 @@primedriver = {}
 @@suvdriver = {}
  
 def addcustomer()
  puts "Enter the id"
  id=gets.chomp.to_i
  puts "Enter the name"
  name=gets.chomp
  puts "Enter the contact number"
  num=gets.chomp
  puts "Enter the location co-ordinates (x,y)"
  *loc= gets.chomp

 @@freecustomer << Customer.new(id,name,num,*loc)
 
 end
 
  

 def adddriver()
  puts "Enter the id"
  id=gets.chomp.to_i
  puts "Enter the name"
  name=gets.chomp
  puts "Enter the contact number"
  num=gets.chomp
  puts "Enter the location co-ordinates(x,y)"
  *loc= gets.chomp

  puts "Enter the type of car(1.Micro 2.Mini 3.Prime 4.SUV)"
  type = gets.chomp.to_i
  
  
  puts "Enter the registration number"
  regno = gets.chomp
  puts "Enter the color"
  color= gets.chomp
  temp = Driver.new(id, name, num, *loc, Car.new(type,regno,color))
  @@driver << temp
  if type == 1
   @@microdriver[*loc]=temp
  elsif type == 2
   @@minidriver[*loc]=temp
  elsif type == 3
   @@primedriver[*loc]=temp
  elsif type ==4
   @@suvdriver[*loc]=temp
  end
  
 end
 
  

 def book
  b = Booking.new
  
  *returnvalue = b.books(@@microdriver, @@minidriver, @@primedriver, @@suvdriver)
  @@booking[b.object_id]=b.driver
  
  if returnvalue[0]==1
     @@microdriver.delete(returnvalue[1])
  elsif returnvalue[0]==2
     @@minidriver.delete(returnvalue[1])
  elsif returnvalue[0]==2
     @@primedriver.delete(returnvalue[1])
  elsif returnvalue[0]==2
     @@suvdriver.delete(returnvalue[1])
  end
  
  end
 

end


class Sample
 attr_accessor :flag

 def initialize()
  @flag=0
 end

 def function1
  loop do  
   puts " MAIN MENU : \n1.Add new driver \n2.Add new customer \n3.Book Ride \n4.Exit \nEnter your choice : "
   flag=gets.chomp.to_i
   break if (flag < 1 || flag >= 4)
   s = System.new()
   if(flag == 1)
    s.adddriver
   elsif flag == 2 
    s.addcustomer
   elsif flag == 3
    s.book
   end
  end
 end

end

Sample.new.function1()
