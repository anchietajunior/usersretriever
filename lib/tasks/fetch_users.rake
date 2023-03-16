# frozen_string_literal: true

namespace :fetch_users do
  FetchUsersJob.perform_later
end
