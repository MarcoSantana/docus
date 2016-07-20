class Issuer < ActiveRecord::Base

  has_and_belongs_to_many :documents

  validates_presence_of :name
  #validates_presence_of :name_short

  validates :name, length: { in: 6..150 }
  #validates :name_short, length: { in: 3..10 }



end
