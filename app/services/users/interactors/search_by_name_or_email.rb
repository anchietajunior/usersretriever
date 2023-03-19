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

      def build_search_params
        return {} if params[:name_or_email].blank?

        users = User.arel_table
        users[:name].matches("%#{params[:name_or_email]}%").or(
          users[:email].matches("%#{params[:name_or_email]}%")
        )
      end

      def users
        User.select(:id, :name, :email, :gender, :birthdate)
          .where(build_search_params)
          .order(name: :asc)
          .distinct
      end
    end
  end
end
