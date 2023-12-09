class Writer < ApplicationRecord
  has_many :posts, dependent: :destroy

  # def self.select_lists
  # end

  class << self
    def select_lists
      all.map do |writer|
        [writer.name, writer.id]
      end
    end
  end

  def display_name
  end

  validates :name, uniqueness: true
end
