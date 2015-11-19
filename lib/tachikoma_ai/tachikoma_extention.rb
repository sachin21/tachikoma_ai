module TachikomaAi
  module TachikomaExtention
    def run(strategy)
      begin
        @strategy = TachikomaAi::Strategies.const_get(strategy.capitalize).new
      rescue NameError
        fail LoadError, "Could not find matching strategy for #{strategy}."
      end
      super
    end

    def pull_request
      @pull_request_body += "\n\n" + @strategy.pull_request_body if @strategy
      super
    end
  end
end
