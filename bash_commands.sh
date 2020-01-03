pv access.log | gzip > access.log.gz
# Monitor progress of a command
# Pipe viewer is a terminal-based tool for monitoring the progress of data through a pipeline.
# It can be inserted into any normal pipeline between two processes to give a visual indication
# of how quickly data is passing through, how long it has taken, how near to completion it is,
# and an estimate of how long it will be until completion.
# Source: http://www.catonmat.net/blog/unix-utilities-pipe-viewer/

ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
# Prints a graphical directory tree from your current directory

rm !(*.foo|*.bar|*.baz)
# Deletes all files in a folder that are NOT *.foo, *.bar or *.baz files. Edit the pattern inside the brackets as you like.

strace -ff -e trace=write -e write=1,2 -p SOME_PID
# Intercept stdout/stderr of another process

awk '!x[$0]++' <file>
# Remove duplicate entries in a file without sorting.
# Using awk, find duplicates in a file without sorting, which reorders the contents.
# awk will not reorder them, and still find and remove duplicates which you can then redirect into another file.

ffmpeg -f x11grab -r 25 -s 800x600 -i :0.0 /tmp/outputFile.mpg
# Record a screencast and convert it to an mpeg
# Grab X11 input and create an MPEG at 25 fps with the resolution 800×600

10) Mount a .iso file in UNIX/Linux

mount /path/to/file.iso /mnt/cdrom -oloop
# -o loop lets you use a file as a block device

date -d@1234567890
# Convert seconds to human-readable format
# This example, for example, produces the output, “Fri Feb 13 15:26:30 EST 2009″

^Z $bg $disown
# Job Control
# You’re running a script, command, whatever.. You don’t expect it to take long, now 5pm has rolled around and you’re ready to go home...
# Wait, it’s still running! You forgot to nohup it before running it..
# Suspend it, send it to the background, then disown it...
# The output wont go anywhere, but at least the command will still run...

vim scp://username@host//path/to/somefile
# Edit a file on a remote host using vim

watch -n 1 mysqladmin --user=<user> --password=<password> processlist
# Monitor the queries being run by MySQL
# Watch is a very useful command for periodically running another command –
# in this using mysqladmin to display the processlist.
# This is useful for monitoring which queries are causing your server to clog up.
# More info here: http://codeinthehole.com/archives/2-Monitoring-MySQL-processes.html

\[command]
# Escape any command aliases
# e.g. if rm is aliased for ‘rm -i’, you can escape the alias by prepending a backslash:

ss -p
# Show apps that use internet connection at the moment. (Multi-Language)
for one line per process:

notify-send ["<title>"] "<body>"
# Send pop-up notifications on Gnome
# The title is optional.
# 
# -t: expire time in milliseconds.
# -u: urgency (low, normal, critical).
# -i: icon path.
# On Debian-based systems you may need to install the ‘libnotify-bin’ package.
# Useful to advise when a wget download or a simulation ends. Example:
# wget URL ; notify-send "Done"

mv filename.{old,new}
# Quickly rename a file

cp filename{,.bak}
# Quickly backup or copy a file with bash

rm -f !(survivior.txt)
# Remove all but one specific file

strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo
# Generate a random password 30 characters long
# Find random strings within /dev/urandom.
# Using grep filter to just Alphanumeric characters, and then print the first 30 and remove all the line feeds.

echo "rm -rf /unwanted-but-large/folder" | batch
# Run a command only when load average is below a certain threshold
# Good for one off jobs that you want to run at a quiet time.
# The default threshold is a load average of 0.8 but this can be set using atrun.


watch -n 1 'echo "obase=2;`date +%s`" | bc'
# Create a binary clock.

dd if=/dev/zero of=/dev/null bs=1M count=32768
# Processor / memory bandwidthd? in GB/s
# Read 32GB zero’s and throw them away.

for I in $(mysql -e 'show databases' -s --skip-column-names); do mysqldump $I | gzip > "$I.sql.gz"; done
# Backup all MySQL Databases to individual files

watch -d -n 2 ‘df; ls -FlAt;’
# Like top, but for files

wget –random-wait -r -p -e robots=off -U mozilla http://www.example.com
# Download an entire website
# -p parameter tells wget to include all files, including images.
# -e robots=off you don’t want wget to obey by the robots.txt file
# -U mozilla as your browsers identity.
# –random-wait to let wget chose a random number of seconds to wait, avoid get into black list.
# Other Useful wget Parameters:
# –limit-rate=20k limits the rate at which it downloads files.
# -b continues wget after logging out.
# -o $HOME/wget_log.txt logs the output

du -h –max-depth=1
# List the size (in human readable form) of all sub folders from the current location

time read
time read -sn1 
# A very simple and useful stopwatch, <ctrl> + <d> to stop
# s:silent, n:number of characters.

man ascii
# Quick access to the ASCII table.

net rpc shutdown -I ipAddressOfWindowsPC -U username%password
# Shutdown a Windows machine from Linux
# This will issue a shutdown command to the Windows machine.
# username must be an administrator on the Windows machine.
# Requires samba-common package installed.

net rpc shutdown -r
# Reboot the Windows machine


net rpc abortshutdown
# Abort shut down of the Windows machine

(cd /tmp && ls)
# Jump to a directory, execute a command and jump back to current directory.

ps aux | sort -nk +4 | tail
# Display the top ten running processes – sorted by memory usage
# ps returns all running processes which are then sorted by the 4th field in numerical order and the top 10 are sent to STDOUT.

history | awk ‘{a[$2]++}END{for(i in a){print a[i] ” ” i}}’ | sort -rn | head
# List of commands you use most often

<alt> + <print screen/sys rq> + <R> – <S> – <E> – <I> – <U> – <B>
# Reboot machine when everything is hanging (raising a skinny elephant)
# If the machine is hanging and the only help would be the power button,
# this key-combination will help to reboot your machine (more or less) gracefully.
# R – gives back control of the keyboard
# S – issues a sync
# E – sends all processes but init the term singal
# I – sends all processes but init the kill signal
# U – mounts all filesystem ro to prevent a fsck at reboot
# B – reboots the system
# Save your file before trying this out, this will reboot your machine without warning!
# http://en.wikipedia.org/wiki/Magic_SysRq_key

less +F somelogfile
# Make ‘less’ behave like ‘tail -f’
# Using +F will put less in follow mode. This works similar to ‘tail -f’.
# To stop scrolling, use the interrupt. Then you’ll get the normal benefits of less (scroll, etc.).
# Pressing SHIFT-F will resume the ‘tailling’.

ping -i 60 -a IP_address
# Set audible alarm when an IP address comes online
# Waiting for your server to finish rebooting? Issue the command above and you will hear a beep when it comes online.
# The -i 60 flag tells ping to wait for 60 seconds between ping, putting less strain on your system.
# Vary it to your need. The -a flag tells ping to include an audible bell in the output when 
# a package is received (that is, when your server comes online).


echo "You can simulate on-screen typing just like in the movies" | pv -qL 10
# Simulate typing
# This will output the characters at 10 per second.

python -m smtpd -n -c DebuggingServer localhost:1025
# This command will start a simple SMTP server listening on port 1025 of localhost.
# This server simply prints to standard output all email headers and the email body.

diff <(sort file1) <(sort file2)
# diff two unsorted files without creating temporary files
# bash/ksh subshell redirection (as file descriptors) used as input to diff

mplayer -ao pcm -vo null -vc dummy -dumpaudio -dumpfile <output-file> <input-file>
# Rip audio from a video file.

tr -c “[:digit:]” ” ” < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR=”1;32″ grep –color “[^ ]“
# Matrix Style

sudo dd if=/dev/mem | cat | strings
# This command will show you all the string (plain text) values in ram
# A fun thing to do with ram is actually open it up and take a peek.

cat /etc/issue
# Display which distro is installed

alias ‘ps?’='ps ax | grep ‘
# Easily search running processes (alias).

echo “!!” > foo.sh
# Create a script of the last executed command
# Sometimes commands are long, but useful, so it’s helpful to be able to make them permanent without having to retype them.
# An alternative could use the history command, and a cut/sed line that works on your platform.

wget -qO – “http://www.tarball.com/tarball.gz” | tar zxvf -
# Extract tarball from internet without local saving

nc -vv -l -p 1234 -e /bin/bash
# Create a backdoor on a machine to allow remote connection to bash
# This will launch a listener on the machine that will wait for a connection on port 1234.
# When you connect from a remote machine with something like :
# nc 192.168.0.1 1234
# You will have console access to the machine through bash. (becareful with this one)

sshfs name@server:/path/to/folder /path/to/mount/point
# Mount folder/filesystem through SSH
# Install SSHFS from http://fuse.sourceforge.net/sshfs.html
# Will allow you to mount a folder security over a network.

!!:gs/foo/bar
# Runs previous command replacing foo by bar every time that foo appears
# Very useful for rerunning a long command changing some arguments globally.
# As opposed to ^foo^bar, which only replaces the first occurrence of foo, this one changes every occurrence.

mount | column -t
# Currently mounted file systems in nice layout
# Particularly useful if you’re mounting different drives, using the following command will
# allow you to see all the file systems currently mounted on your computer and their respective specs
# with the added benefit of nice formatting.

ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
# Compare a remote file with a local file
# Useful for checking if there are differences between local and remote files.

mount -t tmpfs tmpfs /mnt -o size=1024m
# Mount a temporary ram partition
# Makes a partition in ram which is useful if you need a temporary working space as read/write access is fast.
# Be aware that anything saved in this partition will be gone after your computer is turned off.

dig +short txt <keyword>.wp.dg.cx
# Query Wikipedia via console over DNS
# Query Wikipedia by issuing a DNS query for a TXT record.
# The TXT record will also include a short URL to the complete corresponding Wikipedia entry.

netstat -tlnp
# Lists all listening ports together with the PID of the associated process
# The PID will only be printed if you’re holding a root equivalent ID.

dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
# Output your microphone to a remote computer’s speaker
# This will output the sound from your microphone port to the ssh target computer’s speaker port.
# The sound quality is very bad, so you will hear a lot of hissing.

echo “ls -l” | at midnight
# Execute a command at a given time
# This is an alternative to cron which allows a one-off task to be scheduled for a certain time.
 
curl -u user:pass -d status=”Tweeting from the shell” http://twitter.com/statuses/update.xml
# Update twitter via curl

ssh -N -L2001:localhost:80 somemachine
# start a tunnel from some machine’s port 80 to your local post 2001
# now you can access the website by going to http://localhost:2001/

reset
# Salvage a broken terminal
# If you bork your terminal by sending binary data to STDOUT or similar,
# you can get your terminal back using this command rather than killing and restarting the session.
# Note that you often won’t be able to see the characters as you type them.

ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -sameq /tmp/out.mpg
# Capture video of a Linux desktop

> file.txt
# Empty a file
# For when you want to flush all content from a file without removing it (hat-tip to Marc Kilgus).

$ssh-copy-id user@host
# Copy ssh keys to user@host to enable password-less ssh logins.
# To generate the keys use the command ssh-keygen

<ctrl> + <x> + <e>
# Rapidly invoke an editor to write a long, complex, or tricky command
# Next time you are using your shell, try typing ctrl-x e (that is holding control key press x and then e).
# The shell will take what you’ve written on the command line thus far and paste it into the editor specified by $EDITOR.
# Then you can edit at leisure using all the powerful macros and commands of vi, emacs, nano, or whatever.

!whatever:p
# Check command history, but avoid running it
# !whatever will search your command history and execute the first command that matches ‘whatever’.
# If you don’t feel safe doing this put :p on #the end to print without executing. Recommended when running as superuser.

mtr google.com
# mtr, better than traceroute and ping combined
# mtr combines the functionality of the traceroute and ping programs in a single network diagnostic tool.
# as mtr starts, it investigates the network connection between the host mtr runs on and HOSTNAME.
# by sending packets with purposly low TTLs. It continues to send packets with low TTL,
# noting the response time of the intervening routers.
# This allows mtr to print the response percentage and response times of the internet route to HOSTNAME.
# A sudden increase in packetloss or response time is often an indication of a bad (or simply over‐loaded) link.

sudo !!
# Run the last command as root
# Useful when you forget to use sudo for a command. “!!” grabs the last run command.

python -m SimpleHTTPServer
# Serve current directory tree at http://$HOSTNAME:8000/

cd -
# Change to the previous working directory
