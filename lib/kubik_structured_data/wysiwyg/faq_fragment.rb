# frozen_string_literal: true

module KubikStructuredData
  module Wysiwyg
    class FaqFragment
      def self.from_block(data)
        items = Array(data["items"] || data["questions"]).filter_map do |item|
          question = item["question"].presence || item["title"]
          answer = item["answer"].presence || item["text"]
          next if question.blank? || answer.blank?

          {
            "@type" => "Question",
            "name" => question,
            "acceptedAnswer" => {
              "@type" => "Answer",
              "text" => answer
            }
          }
        end
        return nil if items.empty?

        {
          "@context" => "https://schema.org",
          "@type" => "FAQPage",
          "mainEntity" => items
        }
      end
    end
  end
end
