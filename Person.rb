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
    puts "ID : #{@id}"
    puts "Name : #{@name}"
    puts "Contact number : #{@contactno}"
    puts "Location co-ordinates : #{@x} #{@y}"
  end
end

