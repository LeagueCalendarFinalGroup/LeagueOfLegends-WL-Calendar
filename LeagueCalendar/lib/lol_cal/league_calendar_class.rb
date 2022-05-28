require "rails"

module LolCal
    class LeagueCalendarClass

        def self.cal_Data(month, year, summonerName)

            #Test code
            array = [Day.new(month, "red", 1), Day.new(year, "Green", 2)]

            #Put your code here Jordan
        end

    end

    Day = Struct.new(:winrate, :color, :dayNumber) do
    
    end
end

