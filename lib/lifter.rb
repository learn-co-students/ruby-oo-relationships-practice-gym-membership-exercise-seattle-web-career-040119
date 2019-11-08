class Lifter
  attr_reader :name, :lift_total

  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select do |membership|
      membership.lifter == self
    end
  end

  def gyms
    memberships.map do |membership|
      membership.gym
    end
  end

  def self.average_lift_total
    Lifter.all.map do |lifter|
      lifter.lift_total
    end.sum/Lifter.all.length
  end

  def total_cost_memberships
    memberships.map do |membership|
      membership.cost
    end.sum
  end

  def sign_up(gym, membership_cost)
    Membership.new(membership_cost, gym, self)
  end

end
