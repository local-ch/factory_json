module FactoryGirl
  module AttributeAssignerWithHashSupport
    def object
      @evaluator.instance = build_class_instance
      build_class_instance.tap do |instance|
        attributes_to_set_on_instance.each do |attribute|
          if instance.respond_to?("#{attribute}=")
            instance.public_send("#{attribute}=", get(attribute))
          elsif instance.is_a?(Hash)
            instance[attribute] = get(attribute)
          else
            fail NoMethodError, "undefined method `#{attribute}=' for #{instance}"
          end
          @attribute_names_assigned << attribute
        end
      end
    end
  end
end
