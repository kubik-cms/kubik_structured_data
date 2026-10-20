# frozen_string_literal: true

module KubikStructuredData
  module Types
    class Article < SchemaDotOrg::SchemaType
      validated_attr :headline, type: String
      validated_attr :description, type: String, allow_nil: true
      validated_attr :url, type: String, allow_nil: true
      validated_attr :date_published, type: String, allow_nil: true
      validated_attr :publisher, type: SchemaDotOrg::Organization, allow_nil: true
    end
  end
end
