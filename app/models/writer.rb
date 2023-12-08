class Writer < ApplicationRecord
  has_many :posts

  # def self.select_lists
  # end

  class << self
    def select_lists
      all.map do |writer|
        [writer.name, writer.id]
      end
    end
  end
end
