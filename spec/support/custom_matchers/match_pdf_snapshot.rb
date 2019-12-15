# frozen_string_literal: true

require "rspec/expectations"

RSpec::Matchers.define :match_pdf_snapshot do |expected_pdf_filename|
  match do |actual|
    save_pdf!(snapshot_path, actual)
  end

  def save_pdf!(path, body)
    File.open(path, "wb") do |f|
      f.write(body)
    end
  end

  def snapshot_path
    File.join(Rails.root, "spec/fixtures/snapshots", "#{expected}.pdf")
  end
end
