/*
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License (the "License").
 * You may not use this file except in compliance with the License.
 *
 * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
 * or http://www.opensolaris.org/os/licensing.
 * See the License for the specific language governing permissions
 * and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
 * If applicable, add the following below this CDDL HEADER, with the
 * fields enclosed by brackets "[]" replaced with your own identifying
 * information: Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */

/*
 * Copyright 2006 Sun Microsystems, Inc.  All rights reserved.
 * Use is subject to license terms.
 */

#pragma ident	"@(#)tst.system.d	1.1	06/08/28 SMI"

#pragma D option quiet
#pragma D option destructive

BEGIN
{
	this->a = 9;
	this->b = -2;

#if !defined(__APPLE__)
	system("echo %s %d %d", "foo", this->a, this->b);
	system("ping localhost");
	system("echo %d", ++this->a);
	system("ping localhost");
	system("echo %d", ++this->a);
	system("ping localhost");
	system("echo %d", ++this->a);
#else
	system("echo %s %d %d", "foo", this->a, this->b);
	system("ping -o localhost > /dev/null && echo localhost is alive");
	system("echo %d", ++this->a);
	system("ping -o localhost > /dev/null && echo localhost is alive");
	system("echo %d", ++this->a);
	system("ping -o localhost > /dev/null && echo localhost is alive");
	system("echo %d", ++this->a);
#endif /* __APPLE__ */
	exit(0);
}
