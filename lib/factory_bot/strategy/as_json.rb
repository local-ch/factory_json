module FactoryBot
  module Strategy
    class AsJSON
      def initialize
        @strategy = FactoryBot.strategy_by_name(:build).new
      end

      def association(runner)
        runner.instance_variable_set :@strategy, :build
        runner.run
      end

      def result(evaluation)
        result = @strategy.result(evaluation)
        evaluation.notify(:before_json, result)

        ::JSON.parse result.to_json
      end
    end
  end
end
