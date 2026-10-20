# frozen_string_literal: true

module KubikStructuredData
  module Helper
    def kubik_structured_data_graph(record: nil, settings: nil, host: nil)
      if respond_to?(:kubik_structured_data_enabled?) && !kubik_structured_data_enabled?
        return "".html_safe
      end

      settings ||= (@kubik_settings || {}).with_indifferent_access
      host ||= request.base_url
      record ||= @kubik_structured_data_subject
      KubikStructuredData::GraphBuilder.render(host: host, settings: settings, record: record).html_safe
    end
  end
end
