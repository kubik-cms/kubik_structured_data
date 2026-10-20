# frozen_string_literal: true

module KubikStructuredData
  class SharedContext
    def initialize(host:, settings: {})
      @host = host.to_s.chomp("/")
      @settings = settings.with_indifferent_access
    end

    def organization
      org = @settings[:schema_organization] || {}
      org = org.with_indifferent_access
      name = org[:name].presence || @settings[:site_title].presence || @settings[:site_name]
      return nil if name.blank?

      logo = org[:logo].presence || "#{@host}/apple-touch-icon.png"
      SchemaDotOrg::Organization.new(
        name: name,
        url: org[:url].presence || @host,
        logo: logo,
        same_as: Array(org[:same_as]).presence
      )
    end

    def website
      SchemaDotOrg::WebSite.new(
        name: @settings[:site_title].presence || @settings[:site_name].presence || "Website",
        url: @host
      )
    end
  end
end
