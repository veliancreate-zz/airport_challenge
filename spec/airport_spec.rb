require 'airport'

describe Airport do
  
  let(:airport) { Airport.new }
  
  context 'taking off and landing' do
    
    it 'a plane can land' do
      expect(airport.can_accept_plane?).to eq(true)
    end
    
    it 'a plane can take off' do
      expect(airport.can_take_off?).to eq(true)
    end

    it 'has a capacity' do
      expect(airport.capacity).to eq(20)
    end  

  end
  
  context 'traffic control' do
    
    it 'a plane cannot land if the airport is full' do
    end
    
    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    
    context 'weather conditions' do
      
      it 'a plane cannot take off when there is a storm brewing' do
      end
      
      it 'a plane cannot land in the middle of a storm' do
      end
      
    end
  end
end