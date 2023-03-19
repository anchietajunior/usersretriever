# frozen_string_literal: true

class FetchUsersJob < ApplicationJob
  queue_as :default
  DEFAULT_LIMIT = 20

  def perform(skip = 0)
    # The skip argument is 0 for the first time the worker is queued
    Users::Organizers::FetchAndCreate.call(skip: skip, limit: DEFAULT_LIMIT)
  end
end
