class Gym
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select do |membership|
      membership.gym == self
    end
  end

  def lifters
    memberships.map do |membership|
      membership.lifter
    end
  end

  def lifters_names
    lifters.map do |lifter|
      lifter.name
    end
  end

  def combined_lift_total
    lifters.map do |lifter|
      lifter.lift_total
    end.sum
  end

end
