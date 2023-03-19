# frozen_string_literal: true

module Users
  module Interactors
    class FetchNextUsers
      include Interactor
      DEFAULT_SKIP = 20

      delegate :skip, to: :context

      def call
        FetchUsersJob.set(wait: 30.seconds).perform_later(users_to_skip)
      end

      private

      def users_to_skip
        skip + DEFAULT_SKIP
      end
    end
  end
end
