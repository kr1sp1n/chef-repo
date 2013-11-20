#
# Cookbook Name:: devenv
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user_id = node[:devenv][:user]
theme = node[:devenv][:ohmyzsh][:theme] || 'superjarin'

git "/home/#{user_id}/.oh-my-zsh" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  reference "master"
  user user_id
  group user_id
  action :checkout
  not_if "test -d /home/#{user_id}/.oh-my-zsh"
end

template "/home/#{user_id}/.zshrc" do
  source "zshrc.erb"
  owner user_id
  group user_id
  variables( :theme => ( theme ))
  action :create_if_missing
end

execute "change shell" do
  command "chsh #{user_id} -s $(which zsh)"
  action :run
end