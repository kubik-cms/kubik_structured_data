# frozen_string_literal: true

require "schema_dot_org"
require "kubik_structured_data/version"
require "kubik_structured_data/configuration"
require "kubik_structured_data/registry"
require "kubik_structured_data/shared_context"
require "kubik_structured_data/graph_builder"
require "kubik_structured_data/mappers/base"
require "kubik_structured_data/mappers/global"
require "kubik_structured_data/types/web_page"
require "kubik_structured_data/types/article"
require "kubik_structured_data/types/news_article"
require "kubik_structured_data/mappers/web_page"
require "kubik_structured_data/mappers/article"
require "kubik_structured_data/mappers/resource"
require "kubik_structured_data/concern"
require "kubik_structured_data/helper"
require "kubik_structured_data/wysiwyg/faq_fragment"
require "kubik_structured_data/engine"

module KubikStructuredData
  class Error < StandardError; end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def registry
      configuration.registry
    end
  end
end
