# frozen_string_literal: true

require "rspec/expectations"
require 'fileutils'

RSpec::Matchers.define :match_pdf_snapshot do |expected|
  match do |actual|
    return true if snapshot_not_exist? && generate_snapshot!
    actual_pdf = MiniMagick::Image.read(actual)
    expected_pdf = MiniMagick::Image.open(snapshot_path)
    @diff_pages = diff_pages(actual_pdf, expected_pdf)
    return true if @diff_pages.empty?
    save_failure_actual_pdf!
    false
  end

  def diff_pages(actual_pdf, expected_pdf)
    actual_pdf.pages.select.with_index do |_, idx|
      actual_blob = actual_pdf.pages[idx].format("jpg").to_blob
      expected_blob = expected_pdf.pages[idx].format("jpg").to_blob
      actual_blob != expected_blob
    end.map.with_index { |_, idx| idx + 1 }
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

  def tmp_dir
    path = Pathname.new(File.join(Rails.root, "tmp/snapshots"))
    FileUtils.mkdir_p(path) unless path.exist?
    path
  end

  def failure_actual_path
    File.join(tmp_dir, "failures_snapshot_#{expected}_.pdf")
  end

  def save_failure_actual_pdf!
    save_pdf!(failure_actual_path, actual)
  end

  def report_message(message)
    RSpec.configuration.reporter.message(message)
  end
end
