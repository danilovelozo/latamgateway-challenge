# frozen_string_literal: true

require "rails_helper"

describe Address::FindByZipcodeService, type: :module do
  describe ".perform!" do
    subject { described_class.perform!(params, user) }

    let!(:user) { create :user }

    context "with valid params" do
      let(:address) { create :address, user: user }

      let(:params) do
        { zipcode: "18076-000" }
      end

      it { expect(subject).to be_truthy }
    end

    context "with invalid params" do
      let(:params) do
        { zipcode: "00000-000" }
      end

      it { expect(subject).to be_nil }
    end
  end
end
