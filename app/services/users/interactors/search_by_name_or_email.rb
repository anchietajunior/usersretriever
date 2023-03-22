# frozen_string_literal: true

module Users
  module Interactors
    class SearchByNameOrEmail
      include Interactor

      delegate :params, to: :context

      def call
        context.users = users
      end

      private

      def build_name_or_email_param
        return {} if params["name_or_email"].blank?

        users_table[:name].matches("%#{params['name_or_email']}%").or(
          users_table[:email].matches("%#{params['name_or_email']}%")
        )
      end

      def build_gender_param
        return {} if params["gender"].blank?

        users_table[:gender].eq(params["gender"].downcase)
      end

      def build_age_param
        return {} if params["age"].blank?

        start_date = Date.new(2000, 1, 1)
        end_date = Date.new(2000, 12, 31)

        if params["age"] == "before"
          users_table[:birthdate].lteq(start_date)
        else
          users_table[:birthdate].gteq(end_date)
        end
      end

      def users_table
        @users_table ||= User.arel_table
      end

      def users
        User.select(:id, :name, :email, :gender, :birthdate, :created_at)
          .where(build_name_or_email_param)
          .where(build_gender_param)
          .where(build_age_param)
          .order(created_at: :desc)
          .distinct
      end
    end
  end
end
