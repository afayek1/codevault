require 'spec_helper'

FactoryGirl.define do
  factory :user do |u|
    u.name Faker::Name.name
    u.email Faker::Internet.email
  end
end