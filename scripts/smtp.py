#!/usr/bin/python3

import smtplib

server      = "sms.renins.com"
fromaddr    = "python@renins.com"
toaddr      = "+79055902305@sms.renins.com"
subject     = "Test from Python"
message     = "Subject: Test Subject444"

headers =   "From: "+ fromaddr + "\n"
headers +=  "To: " + toaddr + "\n"

message = headers + message

server = smtplib.SMTP(server)
server.set_debuglevel(1)
server.sendmail(fromaddr, toaddr, message)
server.quit()

exit(0)
