require "rails"
require 'rubygems'
require 'json'
require 'date'

module LolCal
    $winrate = 0
    $count = 0
    $wincount = 0
    Data = Struct.new(:daynumber, :month, :summonername, :year)
    Day = Struct.new(:winrate, :color, :dayNumber)
    $monthData = Array.new(31)
    for a in 0..31 do
        $monthData[a] = Day.new("-", "white", a)
    end

    class LeagueCalendarClass
        def self.getData (suMMONERNAME, mONTH, dAY, yEAR, filename)
            if filename != nil
                temp = filename["info"]["gameCreation"]/1000
                ts = Time.at(temp)
                if ts.year == yEAR.to_i && ts.month == mONTH.to_i && ts.day == dAY
                    for a in 0..9 do
                        data = filename["info"]["participants"][a]["summonerName"]
                        if ((data <=> suMMONERNAME) == 0)
                            if (filename["info"]["participants"][a]["win"] == true)
                                $wincount = $wincount + 1
                                $count = $count + 1
                            else
                                $count = $count + 1 
                            end
                        end
                    end
                end
            end
        end

        def self.getDay(wincount, losecount, daynumber)
            if(losecount != 0)
                winrate= wincount.to_f/losecount.to_f
                winrate = winrate *100
                if (winrate >= 75)
                    color = "darkgreen"
                elsif (winrate > 50 && winrate < 75)
                    color = "green"
                elsif (winrate == 50)
                    color = "white"
                elsif (winrate < 50 && winrate > 25)
                    color = "red"
                elsif (winrate <= 25)
                    color = "darkred"
                end
                tempday = Day.new(winrate, color, daynumber)
                $monthData[daynumber] = tempday
            else
                tempday = Day.new("-", "white", daynumber)
                $monthData[daynumber] = tempday
            end
        end

        def self.cal_Data(month, year, summonerName)
            if(summonerName != nil)
            start = 1
            if (month.to_i % 2 == 0)
                last = 30
            else
                last = 31
            end
            array = RiotApiAccess::getJsonArray(summonerName)
            for i in 1.. 31 do
                for j in 0..array.count do
                    getData(summonerName, month, i, year, array[j])
                end
                getDay($wincount, $count, i, )
                $wincount = 0
                $count = 0
            end
        end
            return $monthData
        end      
    end
end