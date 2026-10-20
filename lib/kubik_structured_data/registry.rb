# frozen_string_literal: true

module KubikStructuredData
  class Registry
    Profile = Struct.new(:schema_type, :mapper_class, :resource_key, keyword_init: true)

    def initialize
      @profiles = {}
    end

    def register(model_name, schema_type:, mapper:, resource_key: nil)
      key = model_name.to_s
      mapper_class = mapper.is_a?(Class) ? mapper : mapper.to_s.constantize
      @profiles[key] = Profile.new(schema_type: schema_type, mapper_class: mapper_class, resource_key: resource_key)
    end

    def profile_for(record)
      @profiles[record.class.name]
    end

    def registered?(record)
      profile_for(record).present?
    end
  end
end
