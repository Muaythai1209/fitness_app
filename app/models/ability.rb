class Ability
  include CanCan::Ability
  attr_reader :user, :policy_params

  def initialize(user)
    @user = user || AdminUser.new # guest user (not logged in)
    alias_action :create, :new, :edit, :read, :update, :destroy, to: :crud

    process_policy
  end

  private

  def process_policy
    send("manage_#{user.role}")
  end

  def manage_super_admin
    can :manage, :all
  end

  def manage_backend_admin
    can :update, [UserFitnessPlan, User]
    can :create, [UserFitnessPlan, User]
    can :read, [UserFitnessPlan, User]
  end
end
