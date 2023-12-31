//-----------------------------------------------------------------------------
// -------------------
// File ....: Client.h
// -------------------
// Author...: Gus J Grubba
// Date ....: November 1995
// O.S. ....: Windows NT 3.51
//
//-----------------------------------------------------------------------------

#ifndef _CLIENTINCLUDE_
#define _CLIENTINCLUDE_

#define DF_MGRPORT 3234

//-----------------------------------------------------------------------------
//-- Helper functions, for submitting jobs with MaxNet

#define INETCREATEHELPERS_INTERFACE_ID Interface_ID(0x1d65311, 0x7e6d8b)

class INetCreateHelpers : public FPStaticInterface {

public:
	virtual void NetCreateJob(Job& nj, CJobText& jobText) = 0;
	virtual bool NetCreateArchive(Job& nj, TCHAR* archivename) = 0;
};

#endif

//-- EOF: Client.h ------------------------------------------------------------
