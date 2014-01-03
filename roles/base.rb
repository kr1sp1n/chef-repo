name "base"
description "base role"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
run_list(
  "recipe[apt]",
  "recipe[base]",
  "recipe[locale]",
  "recipe[chef-solo-search]",
  "recipe[generic-users]",
  "recipe[git]",
  "recipe[curl]",
  "recipe[zsh]",
  "recipe[ntp]",
  "recipe[tmux]",
  "recipe[vim]"
)
# Attributes applied if the node doesn't have it set already.
#default_attributes()
# Attributes applied no matter what the node has set already.
#override_attributes()
