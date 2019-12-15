# frozen_string_literal: true

require "rspec/expectations"

RSpec::Matchers.define :match_pdf_snapshot do |expected|
  match do |actual|
    actual_pdf = MiniMagick::Image.read(actual)
    expected_pdf = MiniMagick::Image.open(snapshot_path)
    diff(actual_pdf, expected_pdf)
  end

  def diff(actual_pdf, expected_pdf)
    actual_pdf.pages[0].format("jpg").to_blob == expected_pdf.pages[0].format("jpg").to_blob
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
