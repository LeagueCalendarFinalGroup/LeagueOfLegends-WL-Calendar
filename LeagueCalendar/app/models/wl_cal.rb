require "lol_cal"

class WlCal < ApplicationRecord
    def self.all_days
        #days = LolCal::daysInfo
        days = [Day.new("50", "red", 1), Day.new("80", "Green", 2)]
    end

    def self.returnCal(monthIn)
        month = monthIn
    end
end

Day = Struct.new(:winrate, :color, :dayNumber) do
    
end