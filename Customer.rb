class Customer < Person
  def initialize(cid, cname, ccontactno, *clocation)
    super(cid, cname, ccontactno, *clocation)
  end
end

