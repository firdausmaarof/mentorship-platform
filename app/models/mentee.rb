# frozen_string_literal: true

class Mentee < ApplicationRecord
  has_secure_password

  has_many :sessions
  has_many :mentors, through: :sessions

  validates_presence_of :name, :email, :password_digest
end
