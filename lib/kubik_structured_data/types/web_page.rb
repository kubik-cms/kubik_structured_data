# frozen_string_literal: true

module KubikStructuredData
  module Types
    class WebPage < SchemaDotOrg::SchemaType
      validated_attr :name, type: String
      validated_attr :description, type: String, allow_nil: true
      validated_attr :url, type: String
    end
  end
end
