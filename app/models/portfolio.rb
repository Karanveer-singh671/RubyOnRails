class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.ruby
    where(subtitle: 'Ruby on Rails')
  end
  scope :ruby_on_rails_portfolio_items, -> {where(subtitle: 'Ruby on Rails')}

  #set callback to change defaults e.g go to form 
  after_initialize :set_defaults


  def set_defaults
    # for the portfolios main image 
    self.main_image ||= "http://placehold.it/600x400"
    self.thumb_image ||= "http://placehold.it/350x300"
  end
end
