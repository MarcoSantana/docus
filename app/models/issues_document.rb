class IssuesDocument < ActiveRecord::Base
  belongs_to :document
  belongs_to :issuer
end
