# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  after_destroy :send_deleted_account_email

  private

  def send_deleted_account_email
    DeletedAccountJob.set(wait: 30.minutes).perform_later(name, email)
  end
end
