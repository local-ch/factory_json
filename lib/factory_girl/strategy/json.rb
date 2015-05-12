module FactoryGirl
  module Strategy
    class JSON
      def association(runner)
        runner.run(:null)
      end

      def result(evaluation)
        evaluation.hash.to_json
      end
    end
  end
end