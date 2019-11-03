# frozen_string_literal: true

PDFKit.configure do |config|
  config.default_options = {
    encoding: "UTF-8",
    page_size: "A4",
    disable_smart_shrinking: false,
    quiet: false,
  }
end
