class Campaign < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :copy1, :message => "Missing Phrase 1"
  validates_presence_of :copy2, :message => "Missing Phrase 2"
  validates_presence_of :size, :message => "Please choose a campaign size"
  validates_presence_of :status
  validates_presence_of :user_id

  validates_uniqueness_of :title, :scope => :user_id, :message => "You already have a campaign with that title, choose a new one."

  

  def campaign_type ## TODO: Add real campaign types
    return "normal"
  end

  def ready?
    return true if self.valid? and self.status.downcase != "in progress"
    nil
  end

  def projected_p_value
    return 0.25 if self.size == "small"
    return 0.5 if self.size == "medium"
    return 0.82 if self.size == "large"
  end

  def save
    self.status = "idle" if self.status.nil?
    super
  end

  # This seems a bit hackish, but I've been programming too long today. Will fix later if need be. Move logic into view?
  def results_in_words
    if self.status.downcase == "idle" || self.status.downcase =="scheduled"
      return "Not ready yet"
    end

    if self.status.downcase == "running"
      return "In progress"
    end

    if self.status.downcase == "no funds"
      return "Please recharge your account"
    end

    if self.status.downcase == "complete"
      return "Click to view"
    end
  end

  def schedule!
    self.status = "scheduled"
    self.save

    # TODO: Setup backend game logic to be initiated by this
  end
end
