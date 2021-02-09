class Blog < ApplicationRecord
  #set enum and column want to use as enum and then key value pairs that can be part of enum draft is default value and published is 1
  # this way other people will only see published blogs not draft ones
  enum status: {draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged
end
