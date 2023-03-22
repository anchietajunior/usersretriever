# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  after_destroy :send_deleted_account_email

  before_create :expire_users_cache
  after_destroy :expire_users_cache

  private

  def expire_users_cache
    Rails.cache.delete_matched("*users/page-*")
  end

  def send_deleted_account_email
    DeletedAccountJob.set(wait: 30.minutes).perform_later(name, email)
  end
end
