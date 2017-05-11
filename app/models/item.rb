class Item < ApplicationRecord
  #attr_accessor :price, :name, :real, :weight, :description
  validates :price, {numericality: {greater_than: 0, allow_nil: true}}
  validates :name, :description, presence: true

  validates :name, presence: true

  # after_initialize {}
  # after_save       {}
  # after_create     {}
  # after_update     {}
  # after_destroy    {}

end
