# See the file LICENSE for redistribution information.
#
# Copyright (c) 2000,2008 Oracle.  All rights reserved.
#
# $Id: test100.tcl,v 12.6 2008/01/08 20:58:53 bostic Exp $
#
# TEST	test100
# TEST	Test for functionality near the end of the queue
# TEST	using test025 (DB_APPEND).
proc test100 { method {nentries 10000} {tnum "100"} args} {
	if { [is_queueext $method ] == 0 } {
		puts "Skipping test$tnum for $method."
		return;
	}
	eval {test025 $method $nentries 4294967000 $tnum} $args
}
