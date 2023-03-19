# frozen_string_literal: true

require "rails_helper"

# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::Organizers::Search do
  describe "#call" do
    subject(:service) { described_class.call(params: params) }
    let!(:user1) { create(:user, name: "Xavier Noria", email: "xavier@fxn.com") }
    let!(:user2) { create(:user, name: "Leia Organa", email: "leia@noria.com") }
    let!(:user3) { create(:user, name: "Rafael França", email: "rafael@franca.com") }

    context "when the search param matches an user name" do
      let(:params) do
        {
          name_or_email: "Raf"
        }
      end

      it "returns an user" do
        expect(service.users).to match_array([user3])
      end
    end

    context "when the search param matches an user name and an user email" do
      let(:params) do
        {
          name_or_email: "Noria"
        }
      end

      it "returns two users" do
        expect(service.users).to match_array([user1, user2])
      end
    end

    context "when the search param does not matche any user" do
      let(:params) do
        {
          name_or_email: "Skywalker"
        }
      end

      it "returns an empty array" do
        expect(service.users).to match_array([])
      end
    end
  end
end
