#! /bin/sh

# disable kernel logging
sed 's/$KLogPermitNonKernelFacility on/#$KLogPermitNonKernelFacility on/' -i /etc/rsyslog.conf
sed 's/$ModLoad imklog/#$ModLoad imklog/' -i /etc/rsyslog.conf

# disable dysfunctional logging to /dev/xconsole
sed 's/^\(daemon\.\*;mail\.\*;\\\)/#\1/' -i /etc/rsyslog.d/50-default.conf
sed 's/^\(\s*news.err;\\\)/#\1/' -i /etc/rsyslog.d/50-default.conf
sed 's/^\(\s*\*\.=debug;\*\.=info;\\\)/#\1/' -i /etc/rsyslog.d/50-default.conf
sed 's!^\(\s*\*\.=notice;\*\.=warn\s*\|/dev/xconsole\)!#\1!' -i /etc/rsyslog.d/50-default.conf

echo '$PreserveFQDN on' >> /etc/rsyslog.conf
