unset PATH
export GEM_VERSION=$(ruby --version | cut -d ' ' -f 2 | sed 's/[a-z][0-9]//g')
export GEMPATH=$HOME/.gem/ruby/$GEM_VERSION/bin
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export JVM_HOME=/usr/lib/jvm
export JAVA_HOME=$JVM_HOME/java-8-openjdk
export PERL_PATH=/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/lib/hardening-wrapper/bin
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$GEMPATH
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
export PATH=$PATH:$PERL_PATH
