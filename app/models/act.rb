class Act < ActiveRecord::Base
  attr_accessible :title, :body
  belongs_to :play

  def self.build act
  	a= Act.new
  	a.title = act["TITLE"]

  end

end
