module FactoryGirl
  module Strategy
    class AsJSON
      def association(runner)
        runner.run(:null)
      end

      def result(evaluation)
        ::JSON.parse evaluation.hash.to_json
      end
    end
  end
end