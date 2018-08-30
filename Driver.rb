class Driver < Person
  @car

  def initialize(did, dname, dcontactno, *dlocation, car)
    super(did, dname, dcontactno, *dlocation)
    @car = car
  end
end

