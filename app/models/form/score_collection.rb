class Form::ScoreCollection < Form::Base
  @@FORM_COUNT = 5
  attr_accessor :scores

  # 繰り返す数を変更
  def self.set_count(count)
    @@FORM_COUNT = count
  end

  def initialize(attributes = {})
    super attributes
    self.scores = @@FORM_COUNT.times.map { Score.new } unless scores.present?
  end

  def scores_attributes=(attributes)
    self.scores = attributes.map { |_, v| Score.new(v) }
  end

  def valid?
    valid_scores = target_scores.map(&:valid?).all?
    super && valid_scores
  end

  def save
    Score.transaction do
      scores.map do |score|
        score.save if score.valid?
      end
    end
    true
  rescue StandardError => e
    false
  end

  def target_scores
    scores.select
  end
end
