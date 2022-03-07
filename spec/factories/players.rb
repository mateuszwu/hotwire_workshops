# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    user
    game
  end
end
