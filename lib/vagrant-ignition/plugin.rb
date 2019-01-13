require "vagrant"

module VagrantPlugins
  module Ignition
    class Plugin < Vagrant.plugin("2")
      name "vagrant-ignition"
      description "Ignition support for the Virtualbox & VMware Vagrant providers"

      config "ignition" do
        require_relative "config"
        Config
      end

      action_hook(:setup_ignition, :machine_action_up) do |hook|
        require_relative "action/setup_ignition"
        hook.before(Vagrant::Action::Builtin::Provision, Action::SetupIgnition)
      end
    end
  end
end
