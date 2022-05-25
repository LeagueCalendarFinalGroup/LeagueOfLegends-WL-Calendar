require "lol_cal"

class WlCalsController < ApplicationController
    def index
      @days = WlCal::all_days()
    end

    def update_calendar
    end

    def cal_params 
      params.require(:cals).permit(:month).to_h
    end
  end