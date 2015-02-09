class Plane

  attr_reader :flying

  def initialize
    take_off!
  end

  def take_off!
    @flying=true
    self
  end

  def land!
    @flying=false
    self
  end

  def flying?
    @flying
  end  

end



