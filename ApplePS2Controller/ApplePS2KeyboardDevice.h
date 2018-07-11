/*
 * Copyright (c) 1998-2000 Apple Computer, Inc. All rights reserved.
 *
 * @APPLE_LICENSE_HEADER_START@
 * 
 * Copyright (c) 1999-2003 Apple Computer, Inc.  All Rights Reserved.
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

#ifndef _APPLEPS2KEYBOARDDEVICE_H
#define _APPLEPS2KEYBOARDDEVICE_H

#include <IOKit/ps2/ApplePS2Device.h>

class ApplePS2Controller;

class ApplePS2KeyboardDevice : public IOService
{
  OSDeclareDefaultStructors(ApplePS2KeyboardDevice);

private:
  ApplePS2Controller * _controller;

public:
  virtual bool attach(IOService * provider);
  virtual void detach(IOService * provider);

  // Interrupt Handling Routines

  virtual void installInterruptAction(OSObject *, PS2InterruptAction);
  virtual void uninstallInterruptAction();

  // Request Submission Routines

  virtual PS2Request * allocateRequest();
  virtual void         freeRequest(PS2Request * request);
  virtual bool         submitRequest(PS2Request * request);
  virtual void         submitRequestAndBlock(PS2Request * request);
};

#endif /* !_APPLEPS2KEYBOARDDEVICE_H */
