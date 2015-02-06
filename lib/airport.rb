require_relative './weather'

class Airport

  include Weather

  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(options = {})

    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)

  end 

  def can_accept_plane?
      true
  end 

  def can_take_off?
    true
  end  

end