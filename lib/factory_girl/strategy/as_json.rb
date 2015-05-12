module FactoryGirl
  module Strategy
    class AsJSON
      def association(runner)
        runner.run(:null)
      end

      def result(evaluation)
        build_class = evaluation.instance_variable_get(:@attribute_assigner).instance_variable_get(:@build_class)
        
        source = 
          build_class == Hash ? evaluation.hash : evaluation.object

        ::JSON.parse source.to_json
      end
    end
  end
end