module FactoryGirl
  module Strategy
    class JSON
      def association(runner)
        runner.run(:null)
      end

      def result(evaluation)
        source = 
          build_class_is_hash?(evaluation) ? evaluation.hash : evaluation.object

        source.to_json
      end

      private

      def build_class_is_hash?(evaluation)
        evaluation.instance_variable_get(:@attribute_assigner).instance_variable_get(:@build_class) == Hash
      end
    end
  end
end