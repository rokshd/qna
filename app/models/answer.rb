class Answer < ApplicationRecord
  belongs_to :question
  has_many :attachments, as: :attachable, dependent: :destroy

  belongs_to :user

  validates :body, presence: true

  accepts_nested_attributes_for :attachments, reject_if: :all_blank,
    allow_destroy: true

  scope :helpful, -> { order(best: :desc).order(created_at: :asc) }

  def set_best
    self.transaction do
      self.question.answers.update_all(best: false)
      self.update!(best: true)
    end
  end
end
