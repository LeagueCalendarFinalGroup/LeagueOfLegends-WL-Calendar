require "lol_cal"

class WlCalsController < ApplicationController
    def index
      @days = WlCal::all_days()
    end

    def create 

    end
  end