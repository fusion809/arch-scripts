export GHUB=$HOME/GitHub
export ARS=$GHUB/arch-scripts
export PKG=$GHUB/PKGBUILDs
export CHROOT=$HOME/chroot
export ABS=$HOME/abs
export AUR=$HOME/AUR
export EDITOR=vim

# PATH
unset PATH
export GEMPATH=/root/.gem/ruby/2.3.0/bin:$HOME/.gem/ruby/2.3.0/bin
export GOPATH=$HOME
export GOROOT=/usr/lib/go
export JVM_HOME=/usr/lib/jvm
export JAVA_HOME=$JVM_HOME/default/bin:$JVM_HOME/java-7-openjdk/bin/
export PERL_PATH=$HOME/perl5/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
export PATH=$HOME/perl5/bin:/usr/local/bin:/usr/lib/hardening-wrapper/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:$GOROOT/bin:$GEMPATH:$PERL_PATH:$JAVA_HOME
#:$HOME/bin

# OBS
export OBS=$HOME/OBS/home:fusion809:arch_extra
export OBSC="$OBS":community
export OBSM="$OBS":multilib
export OBSP="$OBS":python
export OBSE="$OBS":extra
