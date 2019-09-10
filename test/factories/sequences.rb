# frozen_string_literal: true

FactoryBot.define do
  sequence :content do |_n|
    Faker::Lorem.paragraph_by_chars(number: 300)
  end
end
