# frozen_string_literal: true

module KubikStructuredData
  module Mappers
    class Base
      def initialize(record:, host:, context:, resource_key: nil)
        @record = record
        @host = host.to_s.chomp("/")
        @context = context
        @resource_key = resource_key
      end

      def build
        raise NotImplementedError
      end

      protected

      def meta
        @record.meta_tag if @record.respond_to?(:meta_tag)
      end

      def description
        meta&.meta_description.presence || @record.try(:listing_summary).presence || @record.try(:page_intro)
      end

      def headline
        @record.try(:title) || @record.try(:page_header)
      end

      def canonical_path
        if defined?(KubikMetatagable) && KubikMetatagable.respond_to?(:configuration)
          routes = Rails.application.routes.url_helpers
          KubikMetatagable.configuration.canonical_path_for(@record, routes)
        else
          "/"
        end
      rescue StandardError
        "/"
      end

      def url
        "#{@host}#{canonical_path}"
      end

      def include_optional?(key)
        return true unless @resource_key && defined?(KubikSettings::ResourceResolver)
        return true unless KubikSettings::ResourceResolver.registered?(@resource_key)

        KubikSettings::ResourceResolver.get(@resource_key, key) != false
      rescue StandardError
        true
      end
    end
  end
end
