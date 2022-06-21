# ansible-osx

Use ansible to configure the mac

Its best to fork this project and make it your own.

## preflight

### checklist

1. git tools installed
1. python pyenv or asdf
1. password for admin

## quick start

### setup

```shell
pip install ansible
ansible-galaxy install -r requirements.yml
```

### check

```shell
ansible-playbook -i "localhost," -c local ansible_osx.yml --ask-become-pass --check
```

### run

```shell
ansible-playbook -i "localhost," -c local ansible_osx.yml --ask-become-pass
```

## finding new configs

When you have a setting you have applied with the Settings application, you can do the following:

1. dump the current settings
1. apply the change in Settings application
1. dump the current settings again
1. compare the changes
1. build the `defaults write` command to repeat in the future

### dump the current settings

```shell
defaults read > default_read.txt
```

### apply the change

Goto the settings application and make a change that you want to be captured

### dump the current settings again

```shell
defaults read > default_read.changed.txt
```

### compare the changes

```shell
diff -y defaults_read.txt defaults_read.changed.txt
```

## TODO

Turn the following into some changes auto applied:

```shell
defaults write com.apple.Safari ShowFullURLInSmartSearchField -int 1
defaults write com.apple.Safari ShowStatusBar -bool true
defaults write com.apple.Safari AutoOpenSafeDownLoads -bool false
defaults write com.apple.Safari CommandClickMakesTabs -bool true
defaults write com.apple.Safari SafariGeolocationPermissionPolicy -int 1

chflags nohidden "${HOME}/Library"

defaults write com.apple.Finder AppleShowAllFiles true

defaults write NSGlobalDomain "AppleEnableMenuBarTransparency" -bool false

defaults write com.apple.archiveutility "dearchive-reveal-after" -bool false

function killallApps() {
  killall "Finder" > /dev/null 2>&1
  killall "SystemUIServer" > /dev/null 2>&1
  killall "Dock" > /dev/null 2>&1
  
  appsToKill=(
  "Safari"
  )
  
  for app in "${appsToKill}"
  do
    killall "${app}" > /dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        open 0a "${app}"
    fi
  done
  
  echo "Best to restart/logout+login to apply all changes"
}
```
