require_relative 'weather'
require 'plane'

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

  def plane_has_clearance?
    
    confirmed_weather = weather_test(self.weather_prob)#weather_test and weather_prob method in weather module
    allow_or_deny_clearance(confirmed_weather)
  
  end  

  def allow_or_deny_clearance(weather)
    
    if weather == 'sunny'      
      true
    else
      false
    end    
  
  end  

  def plane_land(plane)

    if plane_has_clearance? == true
      if !full? 
        if plane.flying
          confirm_land(plane)
        else
          puts "Plane cannot land because it is not flying!"  
        end    
      else
        puts "Plane cannot land because capacity is full. Please wait until space becomes available."
      end    
    else
      puts "Plane cannot land because the weather is stormy. Please try again."
    end

  end      

  def plane_take_off(plane)

    if plane_has_clearance? == true 
      if !plane.flying
        if !empty?
          confirm_take_off(plane)
        else 
          puts "A plane cant take off if there are no planes in the port."
        end
      else
        puts "This plane is already flying, so cant take off."
      end    
    else
      puts "Plane cannot take off because the weather is stormy. Please try again."  
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

