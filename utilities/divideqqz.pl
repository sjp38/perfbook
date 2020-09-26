#!/usr/bin/perl
# SPDX-License-Identifier: GPL-2.0-or-later
#
# Divide qqz.tex for each chapter
#
# Usage:
#
# $ utilities/divideqqz.pl
#
# Note:
#
# Input file is fixed to qqz.tex.
#
# Name of each output file is taken from the 3rd argument of the
# \QuickQAC macro, which originates from the \QuickQuizChapter macro
# in source .tex files.
#
# Copyright (C) Akira Yokosawa, 2020
#
# Authors: Akira Yokosawa <akiyks@gmail.com>

use strict;
use warnings;

my $src_file = "qqz.tex";
my $chp_name;
my $QAC_ptn = "\\\\QuickQAC\\{[^}]*}\\{[^}]*}\\{([^}]*)}" ;
my $out_h;
my $out_file;

open(my $in_h, "<", $src_file) or die "cannot open $src_file: $!" ;
while (my $line = <$in_h>) {
    if ($line =~ /$QAC_ptn/) {
	$out_file = $1 . ".tex" ;
	open ($out_h, ">", $out_file) or die "cannot open $out_file: $!" ;
	print $out_h "% mainfile: perfbook.tex\n" ;
	print $out_h "% Do not edit! Generated by divideqqz.pl\n" ;
    }
    if ($out_h) {
	print $out_h $line ;
    }
}