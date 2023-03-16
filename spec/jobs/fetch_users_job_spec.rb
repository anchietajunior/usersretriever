# frozen_string_literal: true

require "rails_helper"

RSpec.describe FetchUsersJob, type: :job do
  include ActiveJob::TestHelper

  subject(:job) { described_class.perform_later }

  context "basic functionality" do
    it "queues the job" do
      expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it "queues the job in the correct queue" do
      expect(described_class.new.queue_name).to eq("default")
    end
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end
