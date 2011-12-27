class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
    @nodes = @role.nodes
    @roles = @role.available_roles
    @recipes = @role.available_recipes
  end

  def update
    @role = Role.find(params[:id])
    # @role.nodes.each do |node|
    #   node.run_list = (["recipe[ohai]"] + [node.run_list] + [params[:for_node]]).flatten.uniq.compact
    #   node.save
    # end
    @role.run_list = ["recipe[ohai]"] + params[:for_node]
    @role.save
    redirect_to role_path(@group)
  end
end
