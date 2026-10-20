# frozen_string_literal: true

module KubikStructuredData
  module Mappers
    class WebPage < Base
      def build
        KubikStructuredData::Types::WebPage.new(
          name: headline,
          description: description,
          url: url
        )
      end
    end
  end
end
