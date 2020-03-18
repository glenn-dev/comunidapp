# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
      if user.user_type_id == 1
        can :manage, :all
      elsif user.user_type_id == 2
        can :manage, Communication, building_id: user.building_id
        can [:read, :create, :update], [Department, GeneralExpense, Bill, User, ExpensesDetail, Concept], building_id: user.building_id
      else
        can :read, Communication, building_id: user.building_id
        can [:read, :update], Bill, department_id: user.department_id
      end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
