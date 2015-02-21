#! /bin/sh

# disable kernel logging
sed 's/$KLogPermitNonKernelFacility on/#$KLogPermitNonKernelFacility on/' -i /etc/rsyslog.conf
sed 's/$ModLoad imklog/#$ModLoad imklog/' -i /etc/rsyslog.conf

sed 's#|/dev/xconsole#/dev/console#' -i /etc/rsyslog.d/50-default.conf

echo '$PreserveFQDN on' >> /etc/rsyslog.conf

service rsyslog start
