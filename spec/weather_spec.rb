require 'weather'

class Airport 
end 

describe Weather do
  let(:gatwick){Airport.new}
  it 'weather_prob method returns a number between 1 and 10' do
    expect(gatwick.weather_prob).to be<=10 and be>=1
  end

  it 'weather is stormy or sunny depending on the prob method return value' do  
    expect(gatwick.weather_test(3)).to eq('sunny')
    expect(gatwick.weather_test(2)).to eq('stormy')
  end    
  
end
    