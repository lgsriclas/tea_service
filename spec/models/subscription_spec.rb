require 'rails_helper'

describe Subscription, type: :model do
  describe 'relationships' do
    it { should belong_to :tea }
    it { should belong_to :customer }
  end
end