# AutoPatrol
A very simple script, based on vMenu's Drive Around Randomly.  Configured for ESX, with an option for Standalone as well.

Enable your players to have their cars drive around randomly for them, at preset speeds. They can adjust the speed on the go. Perfect for cops who are waiting between calls, or patrolling trouble areas.

ESX version comes with ESX.Notifications built in. Notification script or dialogs can be modified in `client.lua`.

If using Standalone - you will need to edit the `fxmanifest.lua` and remove the `shared_scripts` and `dependencies` sections. You will also want to edit `client.lua` to setup your own notifications.

<img width="960" alt="AutoPatrol" src="https://user-images.githubusercontent.com/82741759/206888938-05aff291-4086-41c2-8532-c7976784c3eb.png">


Resmon is 0.0 while idle, 0.01 at peaks while in-use.

Config Options for:

- Framework - ESX or Standalone
- Speed Settings - List as many speed options as you want
- Default Speed - Choose which speed is enabled by default
- Speed Units - MPH or KMH
- Drive Style - How the AI will drive while using the AutoPatrol
- Jobs - Which ESX jobs can use this - or disable for everyone
- Keybinds - Registered Keybind for enabling AutoPatrol, and regular key mappings for adjusting speed
