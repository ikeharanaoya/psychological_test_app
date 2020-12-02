class Form::AnswerCollection < Form::Base
  @@FORM_COUNT = 10
  attr_accessor :answers

  # 繰り返す数を変更
  def self.set_count(count)
    @@FORM_COUNT = count
  end

  def initialize(attributes = {})
    super attributes
    self.answers = @@FORM_COUNT.times.map { Answer.new() } unless self.answers.present?
  end

  def answers_attributes=(attributes)
    self.answers = attributes.map { |_, v| Answer.new(v) }
  end

  def valid?
    valid_answers = target_answers.map(&:valid?).all?
    super && valid_answers
  end

  def save
    Answer.transaction do
      self.answers.map do |answer|
        if answer.valid?
          answer.save
        end
      end
    end
      return true
    rescue => e
      return false
  end

  def target_answers
    self.answers.select 
  end
end