class MyModel
  include ActiveModel::Model

  attr_accessor :field

  validates :field, presence: true
end
