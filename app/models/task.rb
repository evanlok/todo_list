class Task < ActiveRecord::Base
  # Associations
  belongs_to :list

  # Validations
  validates :description, :presence => true

  # Scopes
  scope :completed, where(:completed => true)

  # Attributes
  attr_accessible :description
end
