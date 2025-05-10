require 'net/http'
require 'uri'
require 'json'

module AI
  class GeminiService
    API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateText"
    class << self
      def generate_text(prompt)
        api_key = Rails.application.credentials.gemini.api_key
        uri = URI.parse("#{API_URL}?key=#{api_key}")

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        request = Net::HTTP::Post.new(uri.request_uri)
        request["Content-Type"] = "application/json"
        request.body = { prompt: { text: prompt } }.to_json

        response = http.request(request)
        body = JSON.parse(response.body)

        body.dig("candidates", 0, "content", "parts", 0, "text") || "Cannot generate text."
      rescue StandardError => e
        Rails.logger.error("Gemini API Error: #{e.message}")
        "Error generating text."
      end
    end
  end
end
