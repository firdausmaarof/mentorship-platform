# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Session, type: :model do
  it { should validate_presence_of(:mentor) }
  it { should validate_presence_of(:mentee) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:date) }
end
