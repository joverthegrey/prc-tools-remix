Palm OS 68K API SDK
Fall 2004 Release, PRC-Tools version
README File

Copyright (C) 2004 PalmSource, Inc.
All rights reserved.

IMPORTANT:  Read Before Using the Accompanying Software

This release of the Palm OS 68K API SDK supports Palm OS Garnet 5.4
and Palm OS Cobalt 6.1 application development, as well as supporting
previous OS releases.

**********************************************************************
* ENHANCEMENTS AND FIXES -- WHAT'S NEW                               *
**********************************************************************

This SDK release is an update to the Palm OS 5.4 SDK headers released
in early 2004.

The main additions from the previous SDK release include:

- Added CertificateMgr.h header file
- Added ByteOrderUtils.h header file for PNO memory access
- Added AdnDebugMgr.h header file for PNO debugging

New APIs that are documented in this SDK release, but will not be
available on all devices:

Data Manager Auto Backup support
  - DmSync
  - DmSyncDatabase
  
Five-Way Navigation: 
  - FrmCountObjectsInNavOrder
  - FrmGetNavOrder
  - FrmSetNavOrder
  - FrmGetNavEntry
  - FrmSetNavEntry
  - FrmGetNavState
  - FrmSetNavState
  - FrmNavGetFocusRingInfo
  - FrmNavDrawFocusRing
  - FrmNavRemoveFocusRing
  - FrmNavObjectTakeFocus
  
Palm OS Glue Library
  - new glue calls for FrmNav calls that are implemented using
    different traps on the PalmOne Treo 600:
    FrmGlueNavGetFocusRingInfo, FrmGlueNavDrawFocusRing,
    FrmGlueNavRemoveFocusRing, FrmGlueNavObjectTakeFocus
  - new glue call FrmGlueNavIsSupported


Minor changes are listed below:

- Removed CharAttr.h (use TxtGlue.h instead)
- BuildDefines.h: PALMOS_SDK_VERSION updated to 0x0541
- CoreTraps.h: new traps for sysTrapNavSelector, sysTrapDmSync, 
  sysTrapDmSyncDatabase
- Chars.h - added vchrHardRockerCenter, vchrIncomingCall,
  willSendUpKeyMask, PiTech character range
- ConnectionMgr.h: added kCncDeviceKindGPRS, kCncDeviceKindGSM,
  and GPRS and GSM connection parameters
- DataMgr.h: added DmSync and DmSyncDatabase API calls
- ErrorBase.h: added certErrorBase
- PenInputMgr.h: added StatBarSetIcon and StatBarGetIcon API calls
- SysEvent.h: added willSendUpKeyMask  
- SystemMgr.h: added sysFtrNumDmAutoBackup and
  sysFtrNumFiveWayNavVersion
- TextMgr.h: added TxtCharIsRockerKey macro
- Window.h: added pinStatBarSetIcon and pinStatBarGetIcon selectors
- Form.h: new five-way navigation APIs
- UIResource.h: added formNavRscType
- ExpansionMgr.h: added expCapabilityNonRemovable, expCapabilityHidden
- VFSMgr.h: added vfsVolumeAttrNonRemovable and C++ guards
- PalmTypes.h: added macros to support form navigation traps

**********************************************************************
* INSTALLATION INSTRUCTIONS                                          *
**********************************************************************

TBD

**********************************************************************

PalmSource, Inc.
1240 Crossman Avenue
Sunnyvale, California 94089
(408) 400-3000
