# frozen_string_literal: true

class SessionSerializer < ActiveModel::Serializer
  attributes :id, :description, :date, :status, :mentor
  belongs_to :mentor
end
