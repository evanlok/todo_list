class List < ActiveRecord::Base
  # Associations
  has_many :tasks

  # Validations
  validates :name, :presence => true

  # Attributes
  attr_accessible :name, :description, :tasks_attributes
  accepts_nested_attributes_for :tasks
end
