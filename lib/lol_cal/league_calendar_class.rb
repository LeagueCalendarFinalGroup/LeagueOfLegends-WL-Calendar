require "rails"
require 'rubygems'
require 'json'

module LolCal
    $winrate = 0
    $count = 0
    $wincount = 0
    Data = Struct.new(:daynumber, :month, :summonername, :year)
    Day = Struct.new(:dayNumber, :color, :winrate)
    Month = Array.new(31)
    Files = Array.new()
    for a in 0..31 do
        Month[a] = Day.new(a, "white", 50)
    end
    Files[0] = 'input5.json'
    Files[1] = 'input.json'
    Files[2] = 'input2.json'
    Files[3] = 'input3.json'
    Files[4] = 'input4.json'
    class LeagueCalendarClass
        def self.getData (suMMONERNAME, mONTH, dAY, yEAR, filename)
            if filename != nil
                json = File.read(filename)
                obj = JSON.parse(json)
                temp = obj["info"]["gameCreation"]/1000
                ts = Time.at(temp)
                if ts.year == yEAR && ts.month == mONTH && ts.day == dAY
                    for a in 0..9 do
                        data = obj["info"]["participants"][a]["summonerName"]
                        if ((data <=> suMMONERNAME) == 0)
                            if (obj["info"]["participants"][a]["win"] == true)
                                $wincount = $wincount + 1
                                $count = $count + 1
                            else
                                $count = $count + 1 
                            end
                        end
                    end
                    Files.delete(filename)
                end
            end
        end

        def self.getDay(wincount, losecount, daynumber)
            if(losecount != 0)
                winrate= wincount.to_f/losecount.to_f
                winrate = winrate *100
            else
                winrate = 0
            end
            if (winrate > 50)
                color = "green"
            elsif (winrate == 50)
                color = "white"
            else
                color = "red"
            end
            tempday = Day.new(daynumber, color, winrate)
            Month[daynumber] = tempday
        end

        def self.cal_Data(month, year, summonerName)
            for i in 1.. 31 do
                for j in 0..Files.count do
                    getData(summonerName, month, i, year, Files[j])
                end
                getDay($wincount, $count, i)
                $wincount = 0
                $count = 0
            end
            return Month
        end
    end
end