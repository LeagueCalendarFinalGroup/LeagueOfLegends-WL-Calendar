require "lol_cal/league_calendar_class"
require "lol_cal/view_helpers"
require 'lol_cal/api'

module LolCal
    def self.daysInfo
        LeagueCalendarClass::array_func
    end
end 