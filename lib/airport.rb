require 'plane'
require 'weather'

class Airport

  include Weather

  attr_accessor :capacity

  attr_reader :planes

  DEFAULT_CAPACITY = 20

  def initialize(options = {})

    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)

  end 

  def planes
    @planes ||= []
  end 

  def plane_land(plane)

    unless stormy?
      unless full?
        confirm_land(plane)
      else  
        raise "Plane cannot land because capacity is full."
      end    
    else
      raise "Plane cannot land because the weather is stormy."
    end

  end      

  def plane_take_off(plane)

    unless stormy?
      unless empty?
          confirm_take_off(plane)
      else
        raise "No planes are docked."
      end    
    else
      raise "Plane cannot take off because the weather is stormy. Please try again."  
    end

  end

  def confirm_land(plane)
    
    plane.land!
    planes<<plane
  
  end
  
  def confirm_take_off(plane)
    
    plane.take_off!
    planes.delete(plane)
  
  end  

  def plane_count
    
    planes.count
  
  end  

  def full?
    
    planes.count==capacity
  
  end  

  def empty?
    
    planes.count==0
  
  end  

end

