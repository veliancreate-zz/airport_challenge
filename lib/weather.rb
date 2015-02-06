module Weather

  weather=nil

  def weather_test(prob) 
    prob < 3 ? weather = "stormy" : weather = "sunny"
    weather
  end

  def weather_prob
    prob = [1,2,3,5,6,7,8,9,10].sample
    weather_test(prob)
    prob
  end  

end  
