require "riot_api_client/version"
require "riot_api_client/client"
require "riot_api_client/errors"
require 'json'

module LolCal

    class RiotApiAccess
        
        def self.getJsonArray(m_summonerID)
            
            
            stuff = RiotApiClient::Client.new("RGAPI-a7519216-7eac-433b-a20b-439e33821964")
            
            summonerID = stuff.fetch_summoner_by_name(m_summonerID)

            puiid = summonerID["puuid"]

            

            matchHistory = stuff.fetch_matches_by_puuid(puiid,'americas')

            ary = Array.new()
            for i in matchHistory do
                ary.push(stuff.fetch_match_by_match_id(i,'americas'))
            end
            return ary
        end
    end

end