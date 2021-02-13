/* Generated by Nim Compiler v1.4.2 */
/*   (c) 2020 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Linux, amd64, gcc */
/* Command for C compiler:
   gcc -c  -w -fmax-errors=3  -fPIC  -I/home/jose/.choosenim/toolchains/nim-1.4.2/lib -I/home/jose/src/fmi.nim/src/prueba -o /home/jose/src/fmi.nim/src/prueba/.cache/@mcosimulation2.nim.c.o /home/jose/src/fmi.nim/src/prueba/.cache/@mcosimulation2.nim.c */
#define NIM_INTBITS 64

/* section: NIM_merge_HEADERS */

#include "nimbase.h"
#include <string.h>
#undef LANGUAGE_C
#undef MIPSEB
#undef MIPSEL
#undef PPC
#undef R3000
#undef R4000
#undef i386
#undef linux
#undef mips
#undef near
#undef far
#undef powerpc
#undef unix

/* section: NIM_merge_FRAME_DEFINES */
  #  define nimfr_(proc, file) \
      TFrame FR_; \
      FR_.procname = proc; FR_.filename = file; FR_.line = 0; FR_.len = 0; nimFrame(&FR_);

  #  define nimfrs_(proc, file, slots, length) \
      struct {TFrame* prev;NCSTRING procname;NI line;NCSTRING filename; NI len; VarSlot s[slots];} FR_; \
      FR_.procname = proc; FR_.filename = file; FR_.line = 0; FR_.len = length; nimFrame((TFrame*)&FR_);

  #  define nimln_(n, file) \
      FR_.line = n; FR_.filename = file;
  
/* section: NIM_merge_FORWARD_TYPES */
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
typedef struct tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w;
typedef struct tyObject_fmi2CallbackFunctions__dmYHUw9cjWrTLW4e9aaT6AYg tyObject_fmi2CallbackFunctions__dmYHUw9cjWrTLW4e9aaT6AYg;
typedef struct fmi2EventInfo fmi2EventInfo;

/* section: NIM_merge_TYPES */
typedef NU8 tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg;
typedef NU8 tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ;
struct TGenericSeq {
NI len;
NI reserved;
};
struct NimStringDesc {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
typedef NimStringDesc* tyArray__24KAM9afIUgUaqBaEBB6r9bg[3];
typedef NU8 tyEnum_TNimKind__jIBKr1ejBgsfM33Kxw4j7A;
typedef NU8 tySet_tyEnum_TNimTypeFlag__v8QUszD1sWlSIWZz7mC4bQ;
typedef N_NIMCALL_PTR(void, tyProc__ojoeKfW4VYIm36I9cpDTQIg) (void* p, NI op);
typedef N_NIMCALL_PTR(void*, tyProc__WSm2xU5ARYv9aAR4l0z9c9auQ) (void* p);
struct TNimType {
NI size;
NI align;
tyEnum_TNimKind__jIBKr1ejBgsfM33Kxw4j7A kind;
tySet_tyEnum_TNimTypeFlag__v8QUszD1sWlSIWZz7mC4bQ flags;
TNimType* base;
TNimNode* node;
void* finalizer;
tyProc__ojoeKfW4VYIm36I9cpDTQIg marker;
tyProc__WSm2xU5ARYv9aAR4l0z9c9auQ deepcopy;
};
typedef NU8 tyEnum_TNimNodeKind__unfNsxrcATrufDZmpBq4HQ;
struct TNimNode {
tyEnum_TNimNodeKind__unfNsxrcATrufDZmpBq4HQ kind;
NI offset;
TNimType* typ;
NCSTRING name;
NI len;
TNimNode** sons;
};
typedef NU16 tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg;
typedef NI32 tyArray__zBLFLWYYZ1F9cWZALii7NkQ[1];
typedef NU8 tyEnum_fmi2Type__fvJT52iMO9bHIEUsKT6J0Ew;
typedef NI32 tyArray__48IqrAYoce9a50c9bgEbuWGw[4];
struct fmi2EventInfo {
NI32 newDiscreteStatesNeeded;
NI32 terminateSimulation;
NI32 nominalsOfContinuousStatesChanged;
NI32 valuesOfContinuousStatesChanged;
NI32 nextEventTimeDefined;
NF nextEventTime;
};
struct tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w {
NF* r;
tyArray__zBLFLWYYZ1F9cWZALii7NkQ i;
NI32* b;
NCSTRING* s;
NI32* isPositive;
NF time;
NCSTRING instanceName;
tyEnum_fmi2Type__fvJT52iMO9bHIEUsKT6J0Ew type_0;
NCSTRING GUID;
tyObject_fmi2CallbackFunctions__dmYHUw9cjWrTLW4e9aaT6AYg* functions;
NI32 loggingOn;
tyArray__48IqrAYoce9a50c9bgEbuWGw logCategories;
void* componentEnvironment;
tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg state;
fmi2EventInfo eventInfo;
NI32 isDirtyValues;
NI32 isNewEventIteration;
};

/* section: NIM_merge_PROC_HEADERS */
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetStatus)(void* c, tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ s, tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg* value);
N_LIB_PRIVATE N_NIMCALL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, getStatus__8BIUfzqnQUxV5de3jNIigQ)(NCSTRING fname, void* c, tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ s);
static N_INLINE(void, nimZeroMem)(void* p, NI size);
static N_INLINE(void, nimSetMem__zxfKBYntu9cBapkhrCOk1fgmemory)(void* a, int v, NI size);
N_LIB_PRIVATE N_NIMCALL(void, genericAssign)(void* dest, void* src, TNimType* mt);
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, invalidState__CFARkdpiNWnLYTkNRNqeNA)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp, NCSTRING f, tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg statesExpected);
N_LIB_PRIVATE N_NIMCALL(void, filteredLog__lw3suybQ5yRVSDxTrBDwWg)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* instance, tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg status, int categoryIndex, NCSTRING message);
N_NIMCALL(NimStringDesc*, rawNewString)(NI cap);
N_LIB_PRIVATE N_NIMCALL(void, add__8FwY5enLGB0dFerO6Ny9caw)(NimStringDesc** x, NCSTRING y);
static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src);
static N_INLINE(void, copyMem__i80o3k0SgEI5gTRCzYdyWAsystem)(void* dest, void* source, NI size);
static N_INLINE(void, nimCopyMem)(void* dest, void* source, NI size);
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, resizeString)(NimStringDesc* dest, NI addlen);
N_LIB_PRIVATE N_NIMCALL(void, formatValue__3zjq9csYPBcIN7AqvyU5ZLA)(NimStringDesc** result, NimStringDesc* value, NimStringDesc* specifier);
N_LIB_PRIVATE N_NOINLINE(void, raiseIndexError2)(NI i, NI n);
static N_INLINE(NCSTRING, nimToCStringConv)(NimStringDesc* s);
static N_INLINE(void, nimFrame)(TFrame* s);
N_LIB_PRIVATE N_NOINLINE(void, callDepthLimitReached__mMRdr4sgmnykA9aWeM9aDZlw)(void);
static N_INLINE(void, popFrame)(void);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetRealStatus)(void* c, tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ s, NF* value);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetIntegerStatus)(void* c, tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ s, NI32* value);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetBooleanStatus)(void* c, tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ s, NI32* value);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetStringStatus)(void* c, tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ s, NCSTRING* value);

/* section: NIM_merge_DATA */
STRING_LITERAL(TM__3uK4I9cstUnTlzfZODLg5nw_3, "fmi2DoStepStatus", 16);
STRING_LITERAL(TM__3uK4I9cstUnTlzfZODLg5nw_4, "fmi2PendingStatus", 17);
STRING_LITERAL(TM__3uK4I9cstUnTlzfZODLg5nw_5, "fmi2LastSuccessfulTime", 22);
static NIM_CONST tyArray__24KAM9afIUgUaqBaEBB6r9bg TM__3uK4I9cstUnTlzfZODLg5nw_2 = {((NimStringDesc*) &TM__3uK4I9cstUnTlzfZODLg5nw_3),
((NimStringDesc*) &TM__3uK4I9cstUnTlzfZODLg5nw_4),
((NimStringDesc*) &TM__3uK4I9cstUnTlzfZODLg5nw_5)}
;
extern TNimType NTI__77mFvmsOLKik79ci2hXkHEg_;
N_LIB_PRIVATE TNimType NTI__24KAM9afIUgUaqBaEBB6r9bg_;
STRING_LITERAL(TM__3uK4I9cstUnTlzfZODLg5nw_6, ": fmi2StatusKind = ", 19);
STRING_LITERAL(TM__3uK4I9cstUnTlzfZODLg5nw_7, ": Can be called with fmi2DoStepStatus when fmi2DoStep returned "
"fmi2Pending. This is not the case.", 97);
STRING_LITERAL(TM__3uK4I9cstUnTlzfZODLg5nw_8, ": Can be called with fmi2PendingStatus when fmi2DoStep returned"
" fmi2Pending. This is not the case.", 98);
STRING_LITERAL(TM__3uK4I9cstUnTlzfZODLg5nw_9, ": Can be called with fmi2LastSuccessfulTime when fmi2DoStep ret"
"urned fmi2Discard. This is not the case.", 103);
STRING_LITERAL(TM__3uK4I9cstUnTlzfZODLg5nw_10, ": Can be called with fmi2Terminated when fmi2DoStep returned fm"
"i2Discard. This is not the case.", 95);

/* section: NIM_merge_VARS */
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;

/* section: NIM_merge_PROCS */
static N_INLINE(void, nimSetMem__zxfKBYntu9cBapkhrCOk1fgmemory)(void* a, int v, NI size) {
	void* T1_;
	T1_ = (void*)0;
	T1_ = memset(a, v, ((size_t) (size)));
}
static N_INLINE(void, nimZeroMem)(void* p, NI size) {
	nimSetMem__zxfKBYntu9cBapkhrCOk1fgmemory(p, ((int) 0), size);
}
static N_INLINE(void, nimCopyMem)(void* dest, void* source, NI size) {
	void* T1_;
	T1_ = (void*)0;
	T1_ = memcpy(dest, source, ((size_t) (size)));
}
static N_INLINE(void, copyMem__i80o3k0SgEI5gTRCzYdyWAsystem)(void* dest, void* source, NI size) {
	nimCopyMem(dest, source, size);
}
static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src) {
	{
		if (!!((src == ((NimStringDesc*) NIM_NIL)))) goto LA3_;
		copyMem__i80o3k0SgEI5gTRCzYdyWAsystem(((void*) ((&(*dest).data[(*dest).Sup.len]))), ((void*) ((*src).data)), ((NI) ((NI)((*src).Sup.len + ((NI) 1)))));
		(*dest).Sup.len += (*src).Sup.len;
	}
	LA3_: ;
}
static N_INLINE(NCSTRING, nimToCStringConv)(NimStringDesc* s) {
	NCSTRING result;
	result = (NCSTRING)0;
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = (s == ((NimStringDesc*) NIM_NIL));
		if (T3_) goto LA4_;
		T3_ = ((*s).Sup.len == ((NI) 0));
		LA4_: ;
		if (!T3_) goto LA5_;
		result = "";
	}
	goto LA1_;
	LA5_: ;
	{
		result = ((NCSTRING) ((*s).data));
	}
	LA1_: ;
	return result;
}
static N_INLINE(void, nimFrame)(TFrame* s) {
	{
		if (!(framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw == ((TFrame*) NIM_NIL))) goto LA3_;
		(*s).calldepth = ((NI16) 0);
	}
	goto LA1_;
	LA3_: ;
	{
		(*s).calldepth = (NI16)((*framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw).calldepth + ((NI16) 1));
	}
	LA1_: ;
	(*s).prev = framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
	framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw = s;
	{
		if (!((*s).calldepth == ((NI16) 2000))) goto LA8_;
		callDepthLimitReached__mMRdr4sgmnykA9aWeM9aDZlw();
	}
	LA8_: ;
}
static N_INLINE(void, popFrame)(void) {
	framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw = (*framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw).prev;
}
N_LIB_PRIVATE N_NIMCALL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, getStatus__8BIUfzqnQUxV5de3jNIigQ)(NCSTRING fname, void* c, tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ s) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	tyArray__24KAM9afIUgUaqBaEBB6r9bg statusKind;
	tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp;
	NimStringDesc* fmtRes;
	nimfr_("getStatus", "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimZeroMem((void*)statusKind, sizeof(tyArray__24KAM9afIUgUaqBaEBB6r9bg));
	nimln_(7, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
	genericAssign((void*)statusKind, (void*)TM__3uK4I9cstUnTlzfZODLg5nw_2, (&NTI__24KAM9afIUgUaqBaEBB6r9bg_));
	nimln_(10, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
	comp = ((tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w*) (c));
	nimln_(12, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = invalidState__CFARkdpiNWnLYTkNRNqeNA(comp, fname, ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 32));
		if (!T3_) goto LA4_;
		nimln_(13, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA4_: ;
	nimln_(14, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
	nimln_(578, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
	nimln_(14, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
	fmtRes = rawNewString(((NI) 65));
	nimln_(621, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
	add__8FwY5enLGB0dFerO6Ny9caw((&fmtRes), fname);
	nimln_(14, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
	fmtRes = resizeString(fmtRes, 19);
appendString(fmtRes, ((NimStringDesc*) &TM__3uK4I9cstUnTlzfZODLg5nw_6));
	if ((NU)(((NI) (s))) > (NU)(2)){ raiseIndexError2(((NI) (s)), 2); }
	formatValue__3zjq9csYPBcIN7AqvyU5ZLA((&fmtRes), statusKind[(((NI) (s)))- 0], ((NimStringDesc*) NIM_NIL));
	filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0), ((int) 2), nimToCStringConv(fmtRes));
	nimln_(16, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
	switch (s) {
	case ((tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ) 0):
	{
		NimStringDesc* fmtRes_2;
		nimln_(18, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		nimln_(578, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		nimln_(19, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		fmtRes_2 = rawNewString(((NI) 114));
		nimln_(621, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		add__8FwY5enLGB0dFerO6Ny9caw((&fmtRes_2), fname);
		nimln_(19, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		fmtRes_2 = resizeString(fmtRes_2, 97);
appendString(fmtRes_2, ((NimStringDesc*) &TM__3uK4I9cstUnTlzfZODLg5nw_7));
		nimln_(18, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3), ((int) 1), nimToCStringConv(fmtRes_2));
	}
	break;
	case ((tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ) 1):
	{
		NimStringDesc* fmtRes_3;
		nimln_(22, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		nimln_(578, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		nimln_(23, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		fmtRes_3 = rawNewString(((NI) 115));
		nimln_(621, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		add__8FwY5enLGB0dFerO6Ny9caw((&fmtRes_3), fname);
		nimln_(23, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		fmtRes_3 = resizeString(fmtRes_3, 98);
appendString(fmtRes_3, ((NimStringDesc*) &TM__3uK4I9cstUnTlzfZODLg5nw_8));
		nimln_(22, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3), ((int) 1), nimToCStringConv(fmtRes_3));
	}
	break;
	case ((tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ) 2):
	{
		NimStringDesc* fmtRes_4;
		nimln_(26, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		nimln_(578, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		nimln_(27, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		fmtRes_4 = rawNewString(((NI) 120));
		nimln_(621, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		add__8FwY5enLGB0dFerO6Ny9caw((&fmtRes_4), fname);
		nimln_(27, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		fmtRes_4 = resizeString(fmtRes_4, 103);
appendString(fmtRes_4, ((NimStringDesc*) &TM__3uK4I9cstUnTlzfZODLg5nw_9));
		nimln_(26, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3), ((int) 1), nimToCStringConv(fmtRes_4));
	}
	break;
	case ((tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ) 3):
	{
		NimStringDesc* fmtRes_5;
		nimln_(30, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		nimln_(578, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		nimln_(31, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		fmtRes_5 = rawNewString(((NI) 112));
		nimln_(621, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		add__8FwY5enLGB0dFerO6Ny9caw((&fmtRes_5), fname);
		nimln_(31, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		fmtRes_5 = resizeString(fmtRes_5, 95);
appendString(fmtRes_5, ((NimStringDesc*) &TM__3uK4I9cstUnTlzfZODLg5nw_10));
		nimln_(30, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3), ((int) 1), nimToCStringConv(fmtRes_5));
	}
	break;
	}
	nimln_(33, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
	result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 2);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetStatus)(void* c, tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ s, tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg* value) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	nimfr_("fmi2GetStatus", "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(38, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
	result = getStatus__8BIUfzqnQUxV5de3jNIigQ("fmi2GetStatus", c, s);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetRealStatus)(void* c, tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ s, NF* value) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	nimfr_("fmi2GetRealStatus", "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(42, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
	{
		tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp;
		if (!(s == ((tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ) 2))) goto LA3_;
		nimln_(43, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		comp = ((tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w*) (c));
		nimln_(44, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		{
			NIM_BOOL T7_;
			T7_ = (NIM_BOOL)0;
			T7_ = invalidState__CFARkdpiNWnLYTkNRNqeNA(comp, "fmi2GetRealStatus", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 32));
			if (!T7_) goto LA8_;
			nimln_(45, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
			result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
			goto BeforeRet_;
		}
		LA8_: ;
		nimln_(47, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		(*value) = (*comp).time;
		nimln_(48, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0);
		goto BeforeRet_;
	}
	LA3_: ;
	nimln_(50, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
	result = getStatus__8BIUfzqnQUxV5de3jNIigQ("fmi2GetRealStatus", c, s);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetIntegerStatus)(void* c, tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ s, NI32* value) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	nimfr_("fmi2GetIntegerStatus", "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(54, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
	result = getStatus__8BIUfzqnQUxV5de3jNIigQ("fmi2GetIntegerStatus", c, s);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetBooleanStatus)(void* c, tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ s, NI32* value) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	nimfr_("fmi2GetBooleanStatus", "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(59, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
	{
		tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp;
		if (!(s == ((tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ) 3))) goto LA3_;
		nimln_(60, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		comp = ((tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w*) (c));
		nimln_(61, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		{
			NIM_BOOL T7_;
			T7_ = (NIM_BOOL)0;
			T7_ = invalidState__CFARkdpiNWnLYTkNRNqeNA(comp, "fmi2GetBooleanStatus", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 32));
			if (!T7_) goto LA8_;
			nimln_(62, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
			result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
			goto BeforeRet_;
		}
		LA8_: ;
		nimln_(64, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		(*value) = (*comp).eventInfo.terminateSimulation;
		nimln_(65, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0);
		goto BeforeRet_;
	}
	LA3_: ;
	nimln_(67, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
	result = getStatus__8BIUfzqnQUxV5de3jNIigQ("fmi2GetBooleanStatus", c, s);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetStringStatus)(void* c, tyEnum_fmi2StatusKind__nhVGfkW71tb9bjwKTAMnOoQ s, NCSTRING* value) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	nimfr_("fmi2GetStringStatus", "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(71, "/home/jose/src/fmi.nim/src/prueba/cosimulation2.nim");
	result = getStatus__8BIUfzqnQUxV5de3jNIigQ("fmi2GetStringStatus", c, s);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_PRIVATE N_NIMCALL(void, unknown_cosimulation2DatInit000)(void) {

/* section: NIM_merge_TYPE_INIT3 */
NTI__24KAM9afIUgUaqBaEBB6r9bg_.size = sizeof(tyArray__24KAM9afIUgUaqBaEBB6r9bg);
NTI__24KAM9afIUgUaqBaEBB6r9bg_.align = NIM_ALIGNOF(tyArray__24KAM9afIUgUaqBaEBB6r9bg);
NTI__24KAM9afIUgUaqBaEBB6r9bg_.kind = 16;
NTI__24KAM9afIUgUaqBaEBB6r9bg_.base = (&NTI__77mFvmsOLKik79ci2hXkHEg_);
NTI__24KAM9afIUgUaqBaEBB6r9bg_.flags = 2;
}
