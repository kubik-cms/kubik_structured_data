# frozen_string_literal: true

module KubikStructuredData
  module Mappers
    class Article < Base
      def build
        KubikStructuredData::Types::NewsArticle.new(
          headline: headline,
          description: description,
          url: url,
          date_published: @record.try(:date_published)&.iso8601,
          publisher: @context.organization
        )
      end
    end
  end
end
