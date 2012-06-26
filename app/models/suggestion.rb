class Suggestion < ActiveRecord::Base
  validates :primary, presence: { message: 'This field is required' }

  attr_accessible :primary, :secondary, :event

  belongs_to :event
  has_many :votes, dependent: :destroy

  def vote_count
    votes.select(&:persisted?).size
  end
end
