require 'plane'

# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"
describe Plane do
  let(:plane) { Plane.new }

  it 'has a flying status when created' do
    expect(plane).to be_flying
  end

  it 'has a flying status when in the air' do
    expect(plane.take_off!).to be_flying
  end

  it 'can land' do
    expect(plane.land!).to_not be_flying
  end

  it 'changes its status to flying after taking off' do
    plane.land!
    expect do
      plane.take_off!
    end.to change(plane, :flying).from(false).to(true)
  end
end
