# frozen_string_literal: true

module KubikStructuredData
  class Engine < ::Rails::Engine
    isolate_namespace KubikStructuredData

    initializer "kubik_structured_data.view_helpers" do
      ActiveSupport.on_load(:action_view) do
        include KubikStructuredData::Helper
      end
    end
  end
end
