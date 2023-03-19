# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::Organizers::FetchAndCreate do
  include ActiveJob::TestHelper

  describe "#call" do
    subject(:service) { described_class.call(skip: skip, limit: limit) }
    let(:limit) { 20 }

    context "success" do
      context "when fetching the first page with users" do
        let(:skip) { 0 }

        it "fetches and creates 20 users" do
          VCR.use_cassette("result_with_users") do
            expect { service }.to change { User.count }.by(20)
              .and have_enqueued_job(FetchUsersJob).with(20)
          end
        end
      end

      context "when fetching another page with users" do
        let(:skip) { 20 }

        it "fetches and creates 20 users and skip 40 users" do
          VCR.use_cassette("another_result_with_users") do
            expect { service }.to change { User.count }.by(20)
              .and have_enqueued_job(FetchUsersJob).with(40)
          end
        end
      end

      context "when fetching another page without users" do
        let(:skip) { 1000 }

        it "does not create any user" do
          VCR.use_cassette("result_without_users") do
            expect { service }.to not_change { User.count }
              .and not_have_enqueued_job(FetchUsersJob).with(40)
          end
        end
      end
    end

    context "failure" do
      before do
        allow(described_class).to receive(:call).and_raise(Net::ReadTimeout)
      end

      let(:skip) { 20 }

      it "raises an error with a message" do
        VCR.use_cassette("error_result") do
          expect { service }.to raise_error(Net::ReadTimeout)
        end
      end
    end
  end
end
