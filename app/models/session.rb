# frozen_string_literal: true

class Session < ApplicationRecord
  belongs_to :mentor
  belongs_to :mentee

  enum status: %i[pending confirmed cancelled rejected]

  validates_presence_of :description, :status, :date, :mentor, :mentee
end
