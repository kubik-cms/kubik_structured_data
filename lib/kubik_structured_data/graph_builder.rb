# frozen_string_literal: true

module KubikStructuredData
  class GraphBuilder
    def self.render(host:, settings: {}, record: nil, fragments: [])
      new(host: host, settings: settings, record: record, fragments: fragments).render
    end

    def initialize(host:, settings: {}, record: nil, fragments: [])
      @host = host
      @settings = settings
      @record = record
      @fragments = Array(fragments)
    end

    def render
      nodes = []
      nodes << Mappers::Global.new(host: @host, settings: @settings).build
      nodes << record_node if @record
      nodes.concat(@fragments)
      nodes = nodes.compact
      return "" if nodes.empty?

      nodes.map { |node| serialize_node(node) }.join("\n").html_safe
    rescue SchemaDotOrg::InvalidValueError, SchemaDotOrg::RequiredValueMissingError => e
      Rails.logger.warn("[kubik_structured_data] #{e.class}: #{e.message}")
      ""
    end

    private

    def serialize_node(node)
      if node.is_a?(Hash)
        return %(<script type="application/ld+json">#{JSON.generate(node)}</script>).html_safe
      end

      node.to_s
    end

    def record_node
      profile = KubikStructuredData.registry.profile_for(@record)
      return nil unless profile

      context = SharedContext.new(host: @host, settings: @settings)
      profile.mapper_class.new(
        record: @record,
        host: @host,
        context: context,
        resource_key: profile.resource_key
      ).build
    end
  end
end
