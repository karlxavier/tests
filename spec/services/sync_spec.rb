require 'rails_helper'

RSpec.describe Sync do
  let(:candidates) { Google::Sheet.candidates }
  let(:talkpush) { Talkpush::Api.new(candidate: candidates.second) }
  it "can get google sheet candidates" do
    expect(candidates).to be_kind_of(Array)
  end

  it "can get search talkpush candidate" do
    expect(talkpush.candidate_present?).to be true
  end

  it "can create new candidate" do
    expect(talkpush.create_candidate!).to be true
  end
end