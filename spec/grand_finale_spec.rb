require 'airport'
require 'plane'

context 'grand finale' do 

  let(:airport){Airport.new}

  let(:planes){Array.new}

  def create_planes
    6.times do
      plane=Plane.new
      planes<<plane
    end  
  end

  it 'should land each plane' do

    create_planes
    planes.each do |p|
      while airport.plane_count != 6
        begin
          airport.plane_land(p)
        rescue
          next
        end          
      end  
    end
    expect(airport.plane_count).to eq(6)
  end  

  it 'each plane should have a landed status' do

    planes.each do |p|
      expect(p).to be_flying
    end  

  end  

  it 'each plane should be able to take off' do

    planes.each do |p|
      while airport.plane_count !=0
        begin
          airport.plane_land(p)
        rescue
          next
        end
      end
      expect(airport.plane_count).to eq(0)
    end  

  end

  it 'each plane should have a flying status' do
    planes.each do |p|
      expect(p).to_not be_flying
    end  
  end  
end  