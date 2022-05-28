module LolCal
    module ViewHelpers
        def self.calendar(options = {}, &block)
            raise "calendar requires a block" unless block
            LolCal::LeagueCalendarClass.new(self, options).array_func
        end

    end
end