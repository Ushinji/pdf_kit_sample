# frozen_string_literal: true

require "rspec/expectations"

RSpec::Matchers.define :validate_presence_of do |attribute_name|
  match do |model|
    attribute = model.read_attribute(attribute_name)
    attribute.present?
  end

  failure_message do |actual|
    <<-EOS
Expected attribute: #{attribute_name} is not presence.
    EOS
  end
end
