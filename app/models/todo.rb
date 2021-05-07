class Todo < ApplicationRecord  ## Used to be ActiveRecord::Base
  validates :name, presence: true
end
