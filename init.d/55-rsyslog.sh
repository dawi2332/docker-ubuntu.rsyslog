#! /bin/sh

# disable kernel logging
sed 's/$KLogPermitNonKernelFacility on/#$KLogPermitNonKernelFacility on/' -i /etc/rsyslog.conf
sed 's/$ModLoad imklog/#$ModLoad imklog/' -i /etc/rsyslog.conf

# disable dysfunctional logging to /dev/xconsole, use stdout instead
sed 's!|/dev/xconsole!|/dev/fd/1!' -i /etc/rsyslog.d/50-default.conf

# don't run as syslog, run as root
sed 's/$PrivDropToUser syslog/#$PrivDropToUser syslog/' -i /etc/rsyslog.conf
sed 's/$PrivDropToGroup syslog/#$PrivDropToGroup syslog/' -i /etc/rsyslog.conf
