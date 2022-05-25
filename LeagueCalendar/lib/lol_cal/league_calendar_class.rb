require "rails"

module LolCal
    class LeagueCalendarClass
        attr_accessor :view_context, :options
    
        def initialize(view_context, opts = {})
                @view_context = view_context
                @options = opts
        end

        def render(*args, &block)
            options = _normalize_render(*args, &block)
            self.response_body = render_to_body(options)
        end

        def self.array_func
            array = [1, 2, 3, 4]
        end

    end
end