class Portfolio < ApplicationRecord
  includes Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.ruby
    where(subtitle: 'Ruby on Rails')
  end
  scope :ruby_on_rails_portfolio_items, -> {where(subtitle: 'Ruby on Rails')}

  #set callback to change defaults e.g go to form 
  after_initialize :set_defaults


  def set_defaults
    # for the portfolios main image 
    self.main_image ||= Placeholder.image_generator(height: '400', width: '600')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '300')
  end
end
