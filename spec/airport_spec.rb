require './lib/airport'

describe Airport do
  let(:airport) { Airport.new }

  let(:plane) { double :plane, take_off!: false, land!: true, flying?: true }

  let(:plane_landed) { double :plane, take_off!: true, land!: false, flying?: true }

  def fill_airport
    20.times { airport.confirm_land(plane) }
  end

  def empty_airport
    airport.planes.clear
  end

  def stormy_true
    allow(airport).to receive(:stormy?) { true }
  end

  def stormy_false
    allow(airport).to receive(:stormy?) { false }
  end

  def land_plane
    airport.confirm_land(plane)
  end

  def take_off_plane
    airport.confirm_take_off(plane)
  end

  context 'taking off and landing' do
    it 'a plane can land' do
      empty_airport
      expect do
        land_plane
      end.to change{
               airport.plane_count
             }.from(0).to(1)
    end

    it 'a plane can take off' do
      empty_airport
      land_plane
      expect do
        take_off_plane
      end.to change{
               airport.plane_count
             }.from(1).to(0)
    end

    it 'has a capacity' do
      expect(airport.capacity).to eq(20)
    end
  end

  context 'traffic control' do
    it 'a plane cannot land if the airport is full' do
      stormy_false
      fill_airport
      expect { airport.plane_land(plane) }.to raise_error(RuntimeError, 'Plane cannot land because capacity is full.')
    end

    it 'the airport can be empty' do
      empty_airport
      expect(airport.plane_count).to eq(0)
    end

    it 'a plane cannot land if the weather is stormy' do
      stormy_true
      expect { airport.plane_land(plane) }.to raise_error(RuntimeError, 'Plane cannot land because the weather is stormy.')
    end

    it 'a plane cannot take off if the weather is stormy' do
      stormy_true
      expect { airport.plane_take_off(plane) }.to raise_error(RuntimeError, 'Plane cannot take off because the weather is stormy.')
    end

    it 'a plane can land if the weather is sunny' do
      stormy_false
      empty_airport
      expect do
        airport.confirm_land(plane)
      end.to change{
               airport.plane_count
             }.from(0).to(1)
    end

    it 'a plane can take off if the weather is sunny' do
      stormy_false
      land_plane
      expect do
        airport.confirm_take_off(plane)
      end.to change{
               airport.plane_count
             }.from(1).to(0)
    end

    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'weather conditions' do
      it 'the weather can be stormy' do
        stormy_true
        expect(airport).to be_stormy
      end

      it 'the weather can be sunny' do
        stormy_false
        expect(airport).to_not be_stormy
      end
    end # weather conditions
  end # trafiic contolr
end # end Airport
