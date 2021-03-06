/* Generated by Nim Compiler v1.4.2 */
/*   (c) 2020 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Linux, amd64, gcc */
/* Command for C compiler:
   gcc -c  -w -fmax-errors=3  -fPIC  -I/home/jose/.choosenim/toolchains/nim-1.4.2/lib -I/home/jose/src/fmi.nim/src/prueba -o /home/jose/src/fmi.nim/src/prueba/.cache/@mhelpers.nim.c.o /home/jose/src/fmi.nim/src/prueba/.cache/@mhelpers.nim.c */
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
typedef struct tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w;
typedef struct tyObject_fmi2CallbackFunctions__dmYHUw9cjWrTLW4e9aaT6AYg tyObject_fmi2CallbackFunctions__dmYHUw9cjWrTLW4e9aaT6AYg;
typedef struct fmi2EventInfo fmi2EventInfo;
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;

/* section: NIM_merge_TYPES */
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
typedef NU8 tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg;
struct TGenericSeq {
NI len;
NI reserved;
};
struct NimStringDesc {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
typedef struct {
N_NIMCALL_PTR(void, ClP_0) (void* a1, NCSTRING a2, tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg a3, NCSTRING a4, NCSTRING a5, void* ClE_0);
void* ClE_0;
} tyProc__ihdMnMKg5uf38WyS4C7wEw;
typedef struct {
N_NIMCALL_PTR(void, ClP_0) (unsigned int a1, unsigned int a2, void* ClE_0);
void* ClE_0;
} tyProc__ir12mkfU9bAk1e8MSGk2ZxQ;
typedef struct {
N_NIMCALL_PTR(void, ClP_0) (void* a1, void* ClE_0);
void* ClE_0;
} tyProc__uMUlmGrxGbyKfim0kpddgQ;
typedef struct {
N_NIMCALL_PTR(void, ClP_0) (void* a1, tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg a2, void* ClE_0);
void* ClE_0;
} tyProc__dOs5nk6FftN1ND9bueDuSMw;
struct tyObject_fmi2CallbackFunctions__dmYHUw9cjWrTLW4e9aaT6AYg {
tyProc__ihdMnMKg5uf38WyS4C7wEw logger;
tyProc__ir12mkfU9bAk1e8MSGk2ZxQ allocateMemory;
tyProc__uMUlmGrxGbyKfim0kpddgQ freeMemory;
tyProc__dOs5nk6FftN1ND9bueDuSMw stepFinished;
void* componentEnvironment;
};

/* section: NIM_merge_PROC_HEADERS */
N_LIB_PRIVATE N_NIMCALL(void, filteredLog__lw3suybQ5yRVSDxTrBDwWg)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* instance, tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg status, int categoryIndex, NCSTRING message);
N_NIMCALL(NimStringDesc*, rawNewString)(NI cap);
N_LIB_PRIVATE N_NIMCALL(void, formatValue__3zjq9csYPBcIN7AqvyU5ZLA)(NimStringDesc** result, NimStringDesc* value, NimStringDesc* specifier);
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, cstrToNimstr)(NCSTRING str);
static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src);
static N_INLINE(void, copyMem__i80o3k0SgEI5gTRCzYdyWAsystem)(void* dest, void* source, NI size);
static N_INLINE(void, nimCopyMem)(void* dest, void* source, NI size);
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, resizeString)(NimStringDesc* dest, NI addlen);
static N_INLINE(NCSTRING, nimToCStringConv)(NimStringDesc* s);
static N_INLINE(void, nimFrame)(TFrame* s);
N_LIB_PRIVATE N_NOINLINE(void, callDepthLimitReached__mMRdr4sgmnykA9aWeM9aDZlw)(void);
static N_INLINE(void, popFrame)(void);
N_LIB_PRIVATE N_NIMCALL(void, add__8FwY5enLGB0dFerO6Ny9caw)(NimStringDesc** x, NCSTRING y);
N_LIB_PRIVATE N_NOINLINE(void, raiseRangeErrorI)(NI64 i, NI64 a, NI64 b);
N_LIB_PRIVATE N_NIMCALL(void, formatValue__C31L3FTGCD9awB6j0rwrtEQ)(NimStringDesc** result, NU32 value, NimStringDesc* specifier);
static N_INLINE(void, nimZeroMem)(void* p, NI size);
static N_INLINE(void, nimSetMem__zxfKBYntu9cBapkhrCOk1fgmemory)(void* a, int v, NI size);
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, invalidState__CFARkdpiNWnLYTkNRNqeNA)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp, NCSTRING f, tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg statesExpected);
N_LIB_PRIVATE N_NIMCALL(void, formatValue__FHGegxCkY6EscNTF2OFusw)(NimStringDesc** result, int value, NimStringDesc* specifier);

/* section: NIM_merge_DATA */
STRING_LITERAL(TM__9bKbFHQp9axyc66ubv5sqogQ_2, ": Illegal call sequence.", 24);
STRING_LITERAL(TM__9bKbFHQp9axyc66ubv5sqogQ_3, ": Invalid argument ", 19);
STRING_LITERAL(TM__9bKbFHQp9axyc66ubv5sqogQ_4, " = NULL.", 8);
STRING_LITERAL(TM__9bKbFHQp9axyc66ubv5sqogQ_5, ": Illegal value reference ", 26);
STRING_LITERAL(TM__9bKbFHQp9axyc66ubv5sqogQ_6, ".", 1);
STRING_LITERAL(TM__9bKbFHQp9axyc66ubv5sqogQ_7, ": Function not implemented.", 27);
STRING_LITERAL(TM__9bKbFHQp9axyc66ubv5sqogQ_8, " = ", 3);
STRING_LITERAL(TM__9bKbFHQp9axyc66ubv5sqogQ_9, ". Expected ", 11);

/* section: NIM_merge_VARS */
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;

/* section: NIM_merge_PROCS */
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
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, invalidState__CFARkdpiNWnLYTkNRNqeNA)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp, NCSTRING f, tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg statesExpected) {
	NIM_BOOL result;
	nimfr_("invalidState", "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
{	result = (NIM_BOOL)0;
	nimln_(17, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	{
		if (!(comp == 0)) goto LA3_;
		nimln_(18, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		result = NIM_TRUE;
		goto BeforeRet_;
	}
	LA3_: ;
	nimln_(19, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	{
		NIM_BOOL T7_;
		NimStringDesc* fmtRes;
		NimStringDesc* T11_;
		T7_ = (NIM_BOOL)0;
		T7_ = (((NI32) 0) < ((int) ((*comp).state)));
		if (!(T7_)) goto LA8_;
		T7_ = (((NI32) 0) < ((int) (statesExpected)));
		LA8_: ;
		if (!!(T7_)) goto LA9_;
		nimln_(20, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		(*comp).state = ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 1024);
		nimln_(22, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		nimln_(578, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		nimln_(22, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		fmtRes = rawNewString(((NI) 38));
		nimln_(550, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/core/macros.nim");
		T11_ = (NimStringDesc*)0;
		T11_ = cstrToNimstr(f);
		nimln_(22, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		formatValue__3zjq9csYPBcIN7AqvyU5ZLA((&fmtRes), T11_, ((NimStringDesc*) NIM_NIL));
		fmtRes = resizeString(fmtRes, 24);
appendString(fmtRes, ((NimStringDesc*) &TM__9bKbFHQp9axyc66ubv5sqogQ_2));
		filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3), ((int) 1), nimToCStringConv(fmtRes));
		nimln_(23, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		result = NIM_TRUE;
		goto BeforeRet_;
	}
	LA9_: ;
	nimln_(25, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	result = NIM_FALSE;
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, nullPointer__XwrYJ3AKbQGv6XbV79casAA)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp, NCSTRING f, NCSTRING arg, void* p) {
	NIM_BOOL result;
	nimfr_("nullPointer", "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
{	result = (NIM_BOOL)0;
	nimln_(28, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	{
		NimStringDesc* fmtRes;
		if (!(p == 0)) goto LA3_;
		nimln_(29, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		(*comp).state = ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 1024);
		nimln_(30, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		nimln_(578, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		nimln_(30, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		fmtRes = rawNewString(((NI) 55));
		nimln_(621, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		add__8FwY5enLGB0dFerO6Ny9caw((&fmtRes), f);
		nimln_(30, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		fmtRes = resizeString(fmtRes, 19);
appendString(fmtRes, ((NimStringDesc*) &TM__9bKbFHQp9axyc66ubv5sqogQ_3));
		nimln_(621, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		add__8FwY5enLGB0dFerO6Ny9caw((&fmtRes), arg);
		nimln_(30, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		fmtRes = resizeString(fmtRes, 8);
appendString(fmtRes, ((NimStringDesc*) &TM__9bKbFHQp9axyc66ubv5sqogQ_4));
		filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3), ((int) 1), nimToCStringConv(fmtRes));
		nimln_(31, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		result = NIM_TRUE;
		goto BeforeRet_;
	}
	LA3_: ;
	nimln_(33, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	result = NIM_FALSE;
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, vrOutOfRange__UhcMWpzGPUrXCK9cH9a20zjg)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp, NCSTRING f, NU32 vr, int end_0) {
	NIM_BOOL result;
	nimfr_("vrOutOfRange", "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
{	result = (NIM_BOOL)0;
	nimln_(36, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	{
		NimStringDesc* fmtRes;
		if ((NI64)(vr) < ((int) (-2147483647 -1)) || (NI64)(vr) > ((int) 2147483647)){ raiseRangeErrorI(vr, ((int) (-2147483647 -1)), ((int) 2147483647)); }
		if (!(end_0 <= ((int) (vr)))) goto LA3_;
		nimln_(37, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		nimln_(578, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		nimln_(37, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		fmtRes = rawNewString(((NI) 54));
		nimln_(621, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		add__8FwY5enLGB0dFerO6Ny9caw((&fmtRes), f);
		nimln_(37, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		fmtRes = resizeString(fmtRes, 26);
appendString(fmtRes, ((NimStringDesc*) &TM__9bKbFHQp9axyc66ubv5sqogQ_5));
		formatValue__C31L3FTGCD9awB6j0rwrtEQ((&fmtRes), vr, ((NimStringDesc*) NIM_NIL));
		fmtRes = resizeString(fmtRes, 1);
appendString(fmtRes, ((NimStringDesc*) &TM__9bKbFHQp9axyc66ubv5sqogQ_6));
		filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3), ((int) 1), nimToCStringConv(fmtRes));
		nimln_(38, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		(*comp).state = ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 1024);
		nimln_(39, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		result = NIM_TRUE;
		goto BeforeRet_;
	}
	LA3_: ;
	nimln_(41, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	result = NIM_FALSE;
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
static N_INLINE(void, nimSetMem__zxfKBYntu9cBapkhrCOk1fgmemory)(void* a, int v, NI size) {
	void* T1_;
	T1_ = (void*)0;
	T1_ = memset(a, v, ((size_t) (size)));
}
static N_INLINE(void, nimZeroMem)(void* p, NI size) {
	nimSetMem__zxfKBYntu9cBapkhrCOk1fgmemory(p, ((int) 0), size);
}
N_LIB_PRIVATE N_NIMCALL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, unsupportedFunction__s2gyI28xaU28T9acdoCxbzg)(void* c, NCSTRING fName, tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg statesExpected) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp;
	tyProc__ihdMnMKg5uf38WyS4C7wEw log_1;
	NimStringDesc* fmtRes;
	nimfr_("unsupportedFunction", "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(44, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	comp = ((tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w*) (c));
	nimZeroMem((void*)(&log_1), sizeof(tyProc__ihdMnMKg5uf38WyS4C7wEw));
	nimln_(45, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	log_1.ClE_0 = (*(*comp).functions).logger.ClE_0;
	log_1.ClP_0 = (*(*comp).functions).logger.ClP_0;
	nimln_(46, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = invalidState__CFARkdpiNWnLYTkNRNqeNA(comp, fName, statesExpected);
		if (!T3_) goto LA4_;
		nimln_(47, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA4_: ;
	nimln_(48, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0), ((int) 2), fName);
	nimln_(49, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	nimln_(578, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
	nimln_(49, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	fmtRes = rawNewString(((NI) 44));
	nimln_(621, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
	add__8FwY5enLGB0dFerO6Ny9caw((&fmtRes), fName);
	nimln_(49, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	fmtRes = resizeString(fmtRes, 27);
appendString(fmtRes, ((NimStringDesc*) &TM__9bKbFHQp9axyc66ubv5sqogQ_7));
	filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3), ((int) 1), nimToCStringConv(fmtRes));
	nimln_(50, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, invalidNumber__ecYAxsbLzTqP8en2Xizgww)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp, NCSTRING f, NCSTRING arg, int n, int nExpected) {
	NIM_BOOL result;
	nimfr_("invalidNumber", "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
{	result = (NIM_BOOL)0;
	nimln_(9, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	{
		NimStringDesc* fmtRes;
		if (!!((n == nExpected))) goto LA3_;
		nimln_(10, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		(*comp).state = ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 1024);
		nimln_(11, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		nimln_(578, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		nimln_(11, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		fmtRes = rawNewString(((NI) 96));
		nimln_(621, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		add__8FwY5enLGB0dFerO6Ny9caw((&fmtRes), f);
		nimln_(11, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		fmtRes = resizeString(fmtRes, 19);
appendString(fmtRes, ((NimStringDesc*) &TM__9bKbFHQp9axyc66ubv5sqogQ_3));
		nimln_(621, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
		add__8FwY5enLGB0dFerO6Ny9caw((&fmtRes), arg);
		nimln_(11, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		fmtRes = resizeString(fmtRes, 3);
appendString(fmtRes, ((NimStringDesc*) &TM__9bKbFHQp9axyc66ubv5sqogQ_8));
		formatValue__FHGegxCkY6EscNTF2OFusw((&fmtRes), n, ((NimStringDesc*) NIM_NIL));
		fmtRes = resizeString(fmtRes, 11);
appendString(fmtRes, ((NimStringDesc*) &TM__9bKbFHQp9axyc66ubv5sqogQ_9));
		formatValue__FHGegxCkY6EscNTF2OFusw((&fmtRes), nExpected, ((NimStringDesc*) NIM_NIL));
		fmtRes = resizeString(fmtRes, 1);
appendString(fmtRes, ((NimStringDesc*) &TM__9bKbFHQp9axyc66ubv5sqogQ_6));
		filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3), ((int) 1), nimToCStringConv(fmtRes));
		nimln_(12, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
		result = NIM_TRUE;
		goto BeforeRet_;
	}
	LA3_: ;
	nimln_(13, "/home/jose/src/fmi.nim/src/prueba/helpers.nim");
	result = NIM_FALSE;
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
