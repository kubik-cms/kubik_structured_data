# frozen_string_literal: true

module KubikStructuredData
  module Mappers
    class Global
      def initialize(host:, settings:)
        @context = SharedContext.new(host: host, settings: settings)
      end

      def build
        @context.organization || @context.website
      end
    end
  end
end
