# frozen_string_literal: true

require "rspec/expectations"

RSpec::Matchers.define :match_pdf_snapshot do |expected|
  match do |actual|
    return true if snapshot_not_exist? && generate_snapshot!
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

  def snapshot_not_exist?
    !File.exist?(snapshot_path)
  end

  def generate_snapshot!
    save_pdf!(snapshot_path, actual)
    report_message("Generate: #{snapshot_path}")
  end

  def report_message(message)
    RSpec.configuration.reporter.message(message)
  end
end
