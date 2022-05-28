require 'lol_cal'

class WlCalsController < ApplicationController

  def index
    @days = LolCal::LeagueCalendarClass::cal_Data(params[:month], params[:year], params[:summoner])
    @month = params[:month]
    @year = params[:year]
  end


end