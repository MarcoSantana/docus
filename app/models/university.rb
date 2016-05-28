class University < Entity
  has_and_belongs_to_many :users, association_foreign_key: 'user_id'
end
