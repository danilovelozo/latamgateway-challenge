# frozen_string_literal: true

require "rails_helper"

describe User, type: :model do
  describe "#validations" do
    it { is_expected.to validate_presence_of(:email) }

    context "when the email is formatted correctly" do
      it { is_expected.to allow_value("velozo.dan@gmail.com").for(:email) }
    end

    context "when the email is formatted incorrectly" do
      it { is_expected.not_to allow_value("xpto@sss").for(:email) }
    end
  end

  describe "associations" do
    it { is_expected.to have_many(:addresses) }
  end
end
