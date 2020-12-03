class Form::ScoreCollection < Form::Base
  @@FORM_COUNT = 5
  attr_accessor :scores

  # 繰り返す数を変更
  def self.set_count(count)
    @@FORM_COUNT = count
  end

  def initialize(attributes = {})
    super attributes
    self.scores = @@FORM_COUNT.times.map { Score.new() } unless self.scores.present?
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
      self.scores.map do |score|
        if score.valid?
          score.save
        end
      end
    end
      return true
    rescue => e
      return false
  end

  def target_scores
    self.scores.select 
  end
end