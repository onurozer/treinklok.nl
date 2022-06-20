module StationList
  TrainStation = Struct.new(:slug, :name, :code)
  STATIONS = [
    TrainStation.new("utrecht-centraal", "Utrecht", "UT"),
    TrainStation.new("amsterdam-centraal", "Amsterdam", "ASD"),
    TrainStation.new("amsterdam-schiphol", "Schiphol", "SHL"),
    TrainStation.new("rotterdam-centraal", "Rotterdam", "RTD")
  ]

  def self.all
    STATIONS
  end

  def self.find_by_slug(slug)
    STATIONS.select { |x| x.slug == slug }
  end
end
