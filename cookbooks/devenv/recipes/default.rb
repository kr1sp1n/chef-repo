#
# Cookbook Name:: devenv
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user_id = node[:devenv][:user]
theme = node[:devenv][:ohmyzsh][:theme]

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

cookbook_file "/home/#{user_id}/.tmux.conf" do
  source   '.tmux.conf'
  owner user_id
  group user_id
  action   :create
end

vim_dir = "/home/#{user_id}/.vim"
bundle_dir = "#{vim_dir}/bundle"
vundle_dir = "#{bundle_dir}/vundle"

directory vim_dir do
  owner user_id
  group user_id

directory bundle_dir do
  owner user_id
  group user_id
end

directory vundle_dir do
  owner user_id
  group user_id
end

git vundle_dir do
  repository "https://github.com/gmarik/vundle.git"
  reference "master"
  user user_id
  group user_id
  action :sync
end

cookbook_file "/home/#{user_id}/.vimrc" do
  source   '.vimrc'
  owner user_id
  group user_id
  action   :create
end

execute "install vim Bundles" do
  command "vim +BundleInstall +qall"
  user user_id
  group user_id
  action :run
end
