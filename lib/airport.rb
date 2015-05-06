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
    if stormy?
      fail 'Plane cannot land because the weather is stormy.'
    else
      full_check(plane)
    end
  end

  def full_check(plane)
    if full?
      fail 'Plane cannot land because capacity is full.'
    else
      confirm_land(plane)
    end
  end

  def plane_take_off(plane)
    if stormy?
      fail 'Plane cannot take off because the weather is stormy.'
    else
      empty_check(plane)
    end
  end

  def empty_check(plane)
    if empty?
      fail 'No planes are docked.'
    else
      confirm_take_off(plane)
    end
  end

  def confirm_land(plane)
    plane.land!
    planes << plane
  end

  def confirm_take_off(plane)
    plane.take_off!
    planes.delete(plane)
  end

  def plane_count
    planes.count
  end

  def full?
    planes.count == capacity
  end

  def empty?
    planes.count == 0
  end
end
