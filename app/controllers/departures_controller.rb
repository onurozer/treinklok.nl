class DeparturesController < ApplicationController
  include StationList
  def index
    params[:station_id] = "utrecht-centraal" if params[:station_id].nil?
    raise ActionController::RoutingError.new("Station Not Found") unless StationList.all.pluck("slug").include? params[:station_id]

    ns = NsServices.new
    station = StationList.find_by_slug(params[:station_id]).first

    @departures = ns.departures(station.code)
    @stations = StationList.all
  end
end
