require "lol_cal"

class WlCal < ApplicationRecord
       def self.all_days
        #days = LolCal::daysInfo

    end

end

Day = Struct.new(:winrate, :color, :dayNumber) do
    
end