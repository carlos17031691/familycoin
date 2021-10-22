Sample init scripts and service configuration for familycoind
==========================================================

Sample scripts and configuration files for systemd, Upstart and OpenRC
can be found in the contrib/init folder.

    contrib/init/familycoind.service:    systemd service unit configuration
    contrib/init/familycoind.openrc:     OpenRC compatible SysV style init script
    contrib/init/familycoind.openrcconf: OpenRC conf.d file
    contrib/init/familycoind.conf:       Upstart service configuration file
    contrib/init/familycoind.init:       CentOS compatible SysV style init script

Service User
---------------------------------

All three Linux startup configurations assume the existence of a "familycoin" user
and group.  They must be created before attempting to use these scripts.
The macOS configuration assumes familycoind will be set up for the current user.

Configuration
---------------------------------

At a bare minimum, familycoind requires that the rpcpassword setting be set
when running as a daemon.  If the configuration file does not exist or this
setting is not set, familycoind will shutdown promptly after startup.

This password does not have to be remembered or typed as it is mostly used
as a fixed token that familycoind and client programs read from the configuration
file, however it is recommended that a strong and secure password be used
as this password is security critical to securing the wallet should the
wallet be enabled.

If familycoind is run with the "-server" flag (set by default), and no rpcpassword is set,
it will use a special cookie file for authentication. The cookie is generated with random
content when the daemon starts, and deleted when it exits. Read access to this file
controls who can access it through RPC.

By default the cookie is stored in the data directory, but it's location can be overridden
with the option '-rpccookiefile'.

This allows for running familycoind without having to do any manual configuration.

`conf`, `pid`, and `wallet` accept relative paths which are interpreted as
relative to the data directory. `wallet` *only* supports relative paths.

For an example configuration file that describes the configuration settings,
see `share/examples/familycoin.conf`.

Paths
---------------------------------

### Linux

All three configurations assume several paths that might need to be adjusted.

Binary:              `/usr/bin/familycoind`  
Configuration file:  `/etc/familycoin/familycoin.conf`  
Data directory:      `/var/lib/familycoind`  
PID file:            `/var/run/familycoind/familycoind.pid` (OpenRC and Upstart) or `/var/lib/familycoind/familycoind.pid` (systemd)  
Lock file:           `/var/lock/subsys/familycoind` (CentOS)  

The configuration file, PID directory (if applicable) and data directory
should all be owned by the familycoin user and group.  It is advised for security
reasons to make the configuration file and data directory only readable by the
familycoin user and group.  Access to familycoin-cli and other familycoind rpc clients
can then be controlled by group membership.

### macOS

Binary:              `/usr/local/bin/familycoind`  
Configuration file:  `~/Library/Application Support/Familycoin/familycoin.conf`  
Data directory:      `~/Library/Application Support/Familycoin`  
Lock file:           `~/Library/Application Support/Familycoin/.lock`  

Installing Service Configuration
-----------------------------------

### systemd

Installing this .service file consists of just copying it to
/usr/lib/systemd/system directory, followed by the command
`systemctl daemon-reload` in order to update running systemd configuration.

To test, run `systemctl start familycoind` and to enable for system startup run
`systemctl enable familycoind`

NOTE: When installing for systemd in Debian/Ubuntu the .service file needs to be copied to the /lib/systemd/system directory instead.

### OpenRC

Rename familycoind.openrc to familycoind and drop it in /etc/init.d.  Double
check ownership and permissions and make it executable.  Test it with
`/etc/init.d/familycoind start` and configure it to run on startup with
`rc-update add familycoind`

### Upstart (for Debian/Ubuntu based distributions)

Upstart is the default init system for Debian/Ubuntu versions older than 15.04. If you are using version 15.04 or newer and haven't manually configured upstart you should follow the systemd instructions instead.

Drop familycoind.conf in /etc/init.  Test by running `service familycoind start`
it will automatically start on reboot.

NOTE: This script is incompatible with CentOS 5 and Amazon Linux 2014 as they
use old versions of Upstart and do not supply the start-stop-daemon utility.

### CentOS

Copy familycoind.init to /etc/init.d/familycoind. Test by running `service familycoind start`.

Using this script, you can adjust the path and flags to the familycoind program by
setting the FAMILYCOIND and FLAGS environment variables in the file
/etc/sysconfig/familycoind. You can also use the DAEMONOPTS environment variable here.

### macOS

Copy org.familycoin.familycoind.plist into ~/Library/LaunchAgents. Load the launch agent by
running `launchctl load ~/Library/LaunchAgents/org.familycoin.familycoind.plist`.

This Launch Agent will cause familycoind to start whenever the user logs in.

NOTE: This approach is intended for those wanting to run familycoind as the current user.
You will need to modify org.familycoin.familycoind.plist if you intend to use it as a
Launch Daemon with a dedicated familycoin user.

Auto-respawn
-----------------------------------

Auto respawning is currently only configured for Upstart and systemd.
Reasonable defaults have been chosen but YMMV.
