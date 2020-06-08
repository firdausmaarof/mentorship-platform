# frozen_string_literal: true

class Mentor < ApplicationRecord
  has_secure_password

  has_many :sessions
  has_many :mentees, through: :sessions

  validates_presence_of :name, :email, :password_digest
end
