module Weather

  def weather_prob
    prob = [1,2,3,4,5,6,7,8,9,10].sample
  end  

  def weather_test(prob) 
    weather=nil
    prob < 4 ? weather = "stormy" : weather = "sunny"
    weather
  end

end  
