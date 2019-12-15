# frozen_string_literal: true

require "rspec/expectations"

RSpec::Matchers.define :match_pdf_snapshot do |expected_pdf_filename|
  match do |actual|
    puts actual
    puts expected_pdf_filename
  end
end
