#!/usr/bin/perl

use Net::SMTP;

$smtp = Net::SMTP->new('mx3.renins.com', Hello => 'summeronsnow.ru', Debug => 1);

        $smtp->mail('biker@summeronsnow.ru');
#       $smtp->mail('akhitrov@renins.com');
        $smtp->recipient('akhitrov@renins.com');
        $smtp->data();
        $smtp->datasend('From: akhitrov@renins.com');
        #$smtp->datasend('From: akhitrov@summeronsnow.ru');
        $smtp->datasend("\n");
        $smtp->datasend('To: AKhitrov@renins.com');
        $smtp->datasend("\n");
        $smtp->datasend('Message-Id: <20180609120617.1853da1f46c8@summeronsnow.ru>');
        #$smtp->datasend("\n");
        $smtp->datasend('Subject: Hello!');
        $smtp->datasend("\n");
        #$smtp->datasend('To: <mvorobev@renins.com>, <akhitrov@renins.com>');
        #$smtp->datasend('Bcc: <akhitrov@renins.com>');
        #$smtp->datasend('Reply-To: <akhitrov@renins.com>');
        #$smtp->datasend("\n");


        #$smtp->datasend("\n");
        #$smtp->datasend("KKKK");
        #$smtp->datasend("\n");
        #$smtp->datasend('X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*');
        #$smtp->datasend("\n");
        #$smtp->datasend('XJS*C4JDBQADN1.NSBN3*2IDNEN*GTUBE-STANDARD-ANTI-UBE-TEST-EMAIL*C.34X');
        $smtp->datasend("Hello!!!");
        $smtp->dataend();

$smtp->quit;

exit(0);
