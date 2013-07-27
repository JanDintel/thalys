require 'spec_helper'

describe Post do
  let(:post) { FactoryGirl.build(:post) }
  subject { post }

  it { expect(post).to respond_to(:title) }
  it { expect(post).to respond_to(:content) }

  it { expect(post).to validate_presence_of(:title) }
  it { expect(post).to validate_presence_of(:content) }
end
