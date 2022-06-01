require "rails"
require 'rubygems'
require 'json'

module LolCal
    $winrate = 0
    $count = 0
    $wincount = 0
    Data = Struct.new(:daynumber, :month, :summonername, :year)
    Day = Struct.new(:winrate, :color, :dayNumber)
    Month = Array.new(31)
    Files = Array.new()
    for a in 0..31 do
        Month[a] = Day.new(0, "red", a)
    end
    Files[0] = 'lib/lol_cal/input5.json'
    Files[1] = 'lib/lol_cal/input.json'
    Files[2] = 'lib/lol_cal/input2.json'
    Files[3] = 'lib/lol_cal/input3.json'
    Files[4] = 'lib/lol_cal/input4.json'
    class LeagueCalendarClass
        def self.getData (suMMONERNAME, mONTH, dAY, yEAR, filename)
            if filename != nil
                json = File.read(filename)
                obj = JSON.parse(json)
                temp = obj["info"]["gameCreation"]/1000
                ts = Time.at(temp)
                if ts.year == yEAR.to_i && ts.month == mONTH.to_i && ts.day == dAY
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
            case winrate
            when (winrate >= 75)
                color = "darkgreen"
            when (winrate > 50 && winrate < 75)
                color = "green"
            when (winrate == 50)
                color = "white"
            when (winrate < 50 && winrate > 25)
                color = "red"
            when (winrate <= 25)
                color = "darkred"
            end
            tempday = Day.new(winrate, color, daynumber)
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