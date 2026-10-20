# frozen_string_literal: true

module KubikStructuredData
  class Configuration
    attr_reader :registry

    def initialize
      @registry = Registry.new
    end

    def register(model_name, schema_type:, mapper:, resource_key: nil)
      registry.register(model_name, schema_type: schema_type, mapper: mapper, resource_key: resource_key)
    end
  end
end
