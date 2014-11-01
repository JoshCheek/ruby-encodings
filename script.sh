#!/bin/sh

ruby -v > ruby_version

ruby uhm….rb --encoding iso-8859-1:iso-8859-1 > output1.txt

ruby uhm….rb --external-encoding=iso-8859-1 --internal-encoding=iso-8859-1 > output2.txt
