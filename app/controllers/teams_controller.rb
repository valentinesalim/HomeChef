class TeamsController < ApplicationController
    skip_after_action :verify_policy_scoped
    def index
        authorize current_user, policy_class: TeamPolicy
    end
end
