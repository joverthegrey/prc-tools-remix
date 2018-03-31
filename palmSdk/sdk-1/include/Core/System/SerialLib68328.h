/*******************************************************************
 * 							 Pilot Software
 *
 *		 Copyright(c) 1994, Palm Computing Inc., All Rights Reserved  
 *
 *-------------------------------------------------------------------
 * FileName:
 *		SerialLib68328.h
 *
 * Description:
 *		Include file for 68328 Serial Library
 *
 * History:
 *   	2/7/95 Created by Ron Marianetti
 *		vmk	8/21/95	Added defQData field to serial globals
 *
 *******************************************************************/

#ifndef __SERIAL_LIB_68328_H
#define __SERIAL_LIB_68328_H


// Pilot common definitions
#include <SerialMgr.h>


/********************************************************************
 * Serial Globals 
 ********************************************************************/
typedef struct SerGlobalsType {
	UInt					openCount;			// # of times we've been opened
	Int					port;					// DOLATER... NOT NEEDED ???
	SerSettingsType	settings;
	Word					lineErrors;			// line errors bitfield
	
	// Receive Queue. When the queue is empty, qStart == qEnd. When the queue
	//  is full, qStart = qEnd-1 (taking wrap-around into account if necessary).
	Word					qStart;				// start offset of queue
	Word					qEnd;					// end offset of queue
	Word					qSize;				// size of queue
	Ptr					qData;				// pointer to queue data
	Ptr					defQData;			// pointer to default queue data
	
	// Receive Queue semaphore info
	Word					smSignalSize;		// How much the semaphore is waiting for
	Long					smID;					// semaphore ID
	
	DWord					lastRcvTicks;		// tick count of last received char

	// For debugging
	Word					numReceived;		// # of chars received since serial manager opened
	Word					lastErrorStatus;	// receiver status of last line error
	Word					numRcvErrors;		// # of receive line errors since serial manager opened
	} SerGlobalsType;
typedef SerGlobalsType*	SerGlobalsPtr;

#define	serDefaultRcvBufferSize	0x200

#endif	//__SERIAL_LIB_68328_H
