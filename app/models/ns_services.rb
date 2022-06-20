class NsServices
  def initialize
    @conn = Faraday.new(
      url: "https://gateway.apiportal.ns.nl",
      params: {lang: "en"},
      headers: {"Ocp-Apim-Subscription-Key" => Rails.application.credentials.ns_api_key}
    )
  end

  def departures(from_station, maximum_journeys = 10)
    Rails.cache.fetch("#{from_station}_departures", expires_in: 60.seconds) do
      departures_url = "reisinformatie-api/api/v2/departures"
      response = @conn.get(departures_url, {
        station: from_station,
        maxJourneys: maximum_journeys,
        dateTime: (Time.now + 5.minutes).to_datetime.rfc3339
      })
      response_json = JSON.parse(response.body)
      departures = response_json["payload"]["departures"]
      departures
    end
  end
end
