/*
 ===========================================================================
 String::SetUTF8

 Set/unset the internal UTF-8 flag for a string
 
 Author: Alessandro Ranellucci <aar@cpan.org>
 Copyright (c) 2006.
 
 Use this software AT YOUR OWN RISK.
 ===========================================================================
*/

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

static const char my_name[] = "String::SetUTF8";
static const char author[] = "Alessandro Ranellucci <aar@cpan.org>";

MODULE = String::SetUTF8		PACKAGE = String::SetUTF8	PREFIX = ssu_

void
ssu_setUTF8(var)
	SV *var;
    CODE:
    	if (!SvPOK(var)) croak("A non-string variable was passed to setUTF()");
    	SvUTF8_on(var);

void
ssu_unsetUTF8(var)
	SV *var;
    CODE:
    	if (!SvPOK(var)) croak("A non-string variable was passed to setUTF()");
    	SvUTF8_off(var);
