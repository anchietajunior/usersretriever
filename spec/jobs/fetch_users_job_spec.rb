# frozen_string_literal: true

require "rails_helper"

RSpec.describe FetchUsersJob, type: :job do
  include ActiveJob::TestHelper

  describe ".perform" do
    subject(:job) { described_class.perform_later }

    context "enqueuing" do
      it "queues the job" do
        expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
      end

      it "queues the job in the correct queue" do
        expect(described_class.new.queue_name).to eq("default")
      end
    end

    context "calling the organizer to fetch and create the users" do
      it "calls the service" do
        expect(Users::Organizers::FetchAndCreate).to(receive(:call))
        described_class.perform_now
      end
    end
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end
