require "riot_api_client/version"
require "riot_api_client/client"
require "riot_api_client/errors"
require 'json'

module CONCEPTSAPI
   
    puts "Enter summoner ID: "
    name="LetsRollDrew"
    
    stuff = RiotApiClient::Client.new("RGAPI-a7519216-7eac-433b-a20b-439e33821964")
    
    summonerID = stuff.fetch_summoner_by_name(name)

    puiid = summonerID["puuid"]

    puts puiid

    matchHistory = stuff.fetch_matches_by_puuid(puiid,'americas')

    puts matchHistory
    ary = Array.new
    Array.new(20)
    for i in matchHistory do
        ary.push(stuff.fetch_match_by_match_id(i,'americas'))
    end
   
    #for i in ary do
   #     puts ary
   # end
   #^ mass prints the array of json files
end