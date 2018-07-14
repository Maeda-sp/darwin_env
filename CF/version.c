/*
 * Copyright (c) 2005 Apple Computer, Inc. All rights reserved.
 *
 * @APPLE_LICENSE_HEADER_START@
 * 
 * This file contains Original Code and/or Modifications of Original Code
 * as defined in and that are subject to the Apple Public Source License
 * Version 2.0 (the 'License'). You may not use this file except in
 * compliance with the License. Please obtain a copy of the License at
 * http://www.opensource.apple.com/apsl/ and read it before using this
 * file.
 * 
 * The Original Code and all software distributed under the License are
 * distributed on an 'AS IS' basis, WITHOUT WARRANTY OF ANY KIND, EITHER
 * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
 * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT.
 * Please see the License for the specific language governing rights and
 * limitations under the License.
 * 
 * @APPLE_LICENSE_HEADER_END@
 */
/*
 Note that this file is only used to build the CFLite version of CF using the makefile, but not the version that ships with OS X.
 */

#define _STRINGIFY(X)	#X
#define STRINGIFY(V)	_STRINGIFY(V)

const unsigned char kCFCoreFoundationVersionString[] = "@(#)PROGRAM:CoreFoundation  PROJECT:CoreFoundation-" STRINGIFY(VERSION) "  SYSTEM:Darwin  DEVELOPER:" STRINGIFY(USER) "  BUILT:" __DATE__ " " __TIME__ "\n";
const double kCFCoreFoundationVersionNumber = (double)VERSION;

#undef _STRINGIFY
#undef STRINGIFY

