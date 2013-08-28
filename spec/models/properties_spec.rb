require 'spec_helper'

describe Properties do
  let(:properties) { Properties.new }
  subject { properties }

  specify { properties_should respond_to(:name) }
  specify { properties_should respond_to(:header) }

  # specify { expect(properties).to validate_presence_of(:name) }
  # specify { expect(properties).to validate_presence_of(:header) }
end

private

def properties_should(input)
  expect(properties).to(input)
end
