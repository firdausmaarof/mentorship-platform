# frozen_string_literal: true

class Mentee < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :email, :password_digest
end
