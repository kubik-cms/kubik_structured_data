# frozen_string_literal: true

module KubikStructuredData
  module Concern
    extend ActiveSupport::Concern

    class_methods do
      def kubik_structured_data(profile: nil)
        @kubik_structured_data_profile = profile
      end

      def kubik_structured_data_profile
        @kubik_structured_data_profile
      end
    end
  end
end
