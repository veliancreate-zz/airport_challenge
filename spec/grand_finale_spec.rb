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

end  