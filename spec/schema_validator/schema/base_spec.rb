require 'spec_helper'

describe Schema::Base do
  subject { Schema::Base }

  it { is_expected.to respond_to(:validate) }
  it { is_expected.to respond_to(:validate!) }
  it { is_expected.to respond_to(:fully_validate) }
end
