/*
 * Copyright (c) 2003-2004 Apple Computer, Inc. All Rights Reserved.
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

#ifndef _SECURITY_SECKEYCHAINPRIV_H_
#define _SECURITY_SECKEYCHAINPRIV_H_

#include <Security/SecBase.h>

#if defined(__cplusplus)
extern "C" {
#endif

OSStatus SecKeychainCreateNew(SecKeychainRef keychainRef, UInt32 passwordLength, const char* inPassword);

OSStatus SecKeychainMakeFromFullPath(const char *fullPathName, SecKeychainRef *keychainRef);

OSStatus SecKeychainIsValid(SecKeychainRef keychainRef, Boolean* isValid);

OSStatus SecKeychainRemoveFromSearchList(SecKeychainRef keychain);

UInt16 SecKeychainListGetCount(void);

OSStatus SecKeychainListCopyKeychainAtIndex(UInt16 index, SecKeychainRef *keychainRef);

OSStatus SecKeychainListRemoveKeychain(SecKeychainRef *keychainRef);

OSStatus SecKeychainChangePassword(SecKeychainRef keychainRef, UInt32 oldPasswordLength, const void *oldPassword,  UInt32 newPasswordLength, const void *newPassword);

OSStatus SecKeychainCopyLogin(SecKeychainRef *keychainRef);

OSStatus SecKeychainLogin(UInt32 nameLength, const void* name, UInt32 passwordLength, const void* password);

OSStatus SecKeychainLogout();

OSStatus SecKeychainResetLogin(UInt32 passwordLength, const void* password, Boolean resetSearchList);

OSStatus SecKeychainErrFromOSStatus(OSStatus osStatus); /* Should be moved to SecBasePriv.h */


#if defined(__cplusplus)
}
#endif

#endif /* !_SECURITY_SECKEYCHAINPRIV_H_ */
