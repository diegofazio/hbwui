/*
 * Harbour 3.2.0dev (r1912031042)
 * Microsoft Visual C 19.24.28314 (64-bit)
 * Generated C source from "basic.prg"
 */

#include "hbvmpub.h"
#include "hbinit.h"


HB_FUNC( MAIN );
HB_FUNC_EXTERN( HBWUI_INIT );


HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_BASIC )
{ "MAIN", {HB_FS_PUBLIC | HB_FS_FIRST | HB_FS_LOCAL}, {HB_FUNCNAME( MAIN )}, NULL },
{ "HBWUI_INIT", {HB_FS_PUBLIC}, {HB_FUNCNAME( HBWUI_INIT )}, NULL }
HB_INIT_SYMBOLS_EX_END( hb_vm_SymbolInit_BASIC, "basic.prg", 0x0, 0x0003 )

#if defined( HB_PRAGMA_STARTUP )
   #pragma startup hb_vm_SymbolInit_BASIC
#elif defined( HB_DATASEG_STARTUP )
   #define HB_DATASEG_BODY    HB_DATASEG_FUNC( hb_vm_SymbolInit_BASIC )
   #include "hbiniseg.h"
#endif

HB_FUNC( MAIN )
{
	static const HB_BYTE pcode[] =
	{
		36,12,0,176,1,0,106,23,104,116,116,112,115,58,
		47,47,119,119,119,46,104,98,116,114,111,110,46,99,
		111,109,0,106,19,72,66,87,85,73,32,66,97,115,
		105,99,32,83,97,109,112,108,101,0,93,32,3,93,
		88,2,20,4,36,14,0,100,110,7
	};

	hb_vmExecute( pcode, symbols );
}

