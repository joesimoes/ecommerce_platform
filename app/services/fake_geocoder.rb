class FakeGeocoder
  def self.coordinates_for(address)
    case address
    when /New York/
      [40.7128, -74.0060]
    when /San Francisco/
      [37.7749, -122.4194]
    else
      [0.0, 0.0]
    end
  end
end
