require './lib/airport'

describe Airport do
  
  let(:airport) { Airport.new}
  let(:airport_allow_clearance){double :airport, plane_has_clearance?: true, plane_land: nil}
  let(:airport_deny_clearance){double :airport, plane_has_clearance?: false, plane_land: nil}
  let(:plane) { double :plane, land!: true }
  
  def fill_airport
    20.times do airport.confirm_land(plane) end
  end  

  def empty_airport
    airport.planes.clear
  end  

  context 'taking off and landing' do
    
    it 'a plane can land' do
    end
    
    it 'a plane can take off' do

    end

    it 'has a capacity' do
      expect(airport.capacity).to eq(20)
    end  

  end
  
  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do

      fill_airport

      expect{airport.plane_land(plane)}.to raise_error(RuntimeError, "Plane cannot land because capacity is full.")
       
    end



    it 'the airport can be empty' do

      fill_airport
      empty_airport
      expect(airport.plane_count).to eq(0)
    
    end
    

    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    
    context 'weather conditions' do
      
      it 'the weather prob method returns a random number between 1 and 10' do
        expect(airport.weather_prob).to satisfy{ |v| v>=1 && v<=10 }  
      end  

      it 'the weather can be stormy' do
        n = 1
        while n<4 do  
          expect(airport.weather_test(n)).to eq('stormy')
          n+=1
        end    
      end

      it 'the weather can be sunny' do
        n = 4
        while n<10 do
          expect(airport.weather_test(n)).to eq('sunny')
          n+=1              
        end
      end  

    end # weather conditions  
  
  end #trafiic contolr

end #end Airport 