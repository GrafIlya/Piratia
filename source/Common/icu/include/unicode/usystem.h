/*
*******************************************************************************
*   Copyright (C) 2004-2007, International Business Machines
*   Corporation and others.  All Rights Reserved.
*******************************************************************************
*
*   file name:  
*   encoding:   US-ASCII
*   tab size:   8 (not used)
*   indentation:4
*
*   Created by: genheaders.pl, a perl script written by Ram Viswanadha
*
*  Contains data for commenting out APIs.
*  Gets included by umachine.h
*
*  THIS FILE IS MACHINE-GENERATED, DON'T PLAY WITH IT IF YOU DON'T KNOW WHAT
*  YOU ARE DOING, OTHERWISE VERY BAD THINGS WILL HAPPEN!
*/

#ifndef USYSTEM_H
#define USYSTEM_H

#ifdef U_HIDE_SYSTEM_API

#if U_DISABLE_RENAMING
#define u_cleanup u_cleanup_SYSTEM_API_DO_NOT_USE
#define u_setAtomicIncDecFunctions u_setAtomicIncDecFunctions_SYSTEM_API_DO_NOT_USE
#define u_setMemoryFunctions u_setMemoryFunctions_SYSTEM_API_DO_NOT_USE
#define u_setMutexFunctions u_setMutexFunctions_SYSTEM_API_DO_NOT_USE
#define ucnv_setDefaultName ucnv_setDefaultName_SYSTEM_API_DO_NOT_USE
#define uloc_getDefault uloc_getDefault_SYSTEM_API_DO_NOT_USE
#define uloc_setDefault uloc_setDefault_SYSTEM_API_DO_NOT_USE
#else
#define u_cleanup_3_8 u_cleanup_SYSTEM_API_DO_NOT_USE
#define u_setAtomicIncDecFunctions_3_8 u_setAtomicIncDecFunctions_SYSTEM_API_DO_NOT_USE
#define u_setMemoryFunctions_3_8 u_setMemoryFunctions_SYSTEM_API_DO_NOT_USE
#define u_setMutexFunctions_3_8 u_setMutexFunctions_SYSTEM_API_DO_NOT_USE
#define ucnv_setDefaultName_3_8 ucnv_setDefaultName_SYSTEM_API_DO_NOT_USE
#define uloc_getDefault_3_8 uloc_getDefault_SYSTEM_API_DO_NOT_USE
#define uloc_setDefault_3_8 uloc_setDefault_SYSTEM_API_DO_NOT_USE
#endif /* U_DISABLE_RENAMING */

#endif /* U_HIDE_SYSTEM_API */
#endif /* USYSTEM_H */
