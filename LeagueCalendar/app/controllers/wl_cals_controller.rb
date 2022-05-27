require 'lol_cal'

class WlCalsController < ApplicationController

  def index
    @days = WlCal::all_days
    @month = params[:month]
  end


end