#!/usr/bin/perl

use Net::SMPP;
##use Net::SMPP::PDU;

# Prod
#$host           = "10.50.100.103";
#$port           = "2775";
#$username       = "arm";
#$password       = "password";
#$phone          = "+79055902305";
#$message        = "Prod message";

# Test
$host           = "10.50.100.101";
$port           = "5555";
$username       = "cb";
$password       = "password";
$phone          = "+79055902305";
$message        = "Test message";

$smpp = Net::SMPP->new_transmitter($host, port => $port, system_id => $username, password => $password, async => 1) or die;
$resp_pdu = $smpp->submit_sm(destination_addr => $phone, short_message => $message) or die;
