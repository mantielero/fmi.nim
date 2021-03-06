/* Generated by Nim Compiler v1.4.2 */
/*   (c) 2020 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Linux, amd64, gcc */
/* Command for C compiler:
   gcc -c  -w -fmax-errors=3  -fPIC  -I/home/jose/.choosenim/toolchains/nim-1.4.2/lib -I/home/jose/src/fmi.nim/src/prueba -o /home/jose/src/fmi.nim/src/prueba/.cache/@mgetters.nim.c.o /home/jose/src/fmi.nim/src/prueba/.cache/@mgetters.nim.c */
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
typedef NU8 tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg;
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
struct TGenericSeq {
NI len;
NI reserved;
};
struct NimStringDesc {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};

/* section: NIM_merge_PROC_HEADERS */
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetReal)(void* c, NU32* vr, size_t nvr, NF* value);
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, invalidState__CFARkdpiNWnLYTkNRNqeNA)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp, NCSTRING f, tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg statesExpected);
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, nullPointer__XwrYJ3AKbQGv6XbV79casAA)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp, NCSTRING f, NCSTRING arg, void* p);
N_LIB_PRIVATE N_NIMCALL(void, calculateValues__g4m7TFvWvrc0TdD6kxuUaQ)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp);
static N_INLINE(void, nimFrame)(TFrame* s);
N_LIB_PRIVATE N_NOINLINE(void, callDepthLimitReached__mMRdr4sgmnykA9aWeM9aDZlw)(void);
static N_INLINE(void, popFrame)(void);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetInteger)(void* c, NU32* vr, size_t nvr, NI32* value);
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, vrOutOfRange__UhcMWpzGPUrXCK9cH9a20zjg)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp, NCSTRING f, NU32 vr, int end_0);
N_LIB_PRIVATE N_NIMCALL(NU32, X5BX5D___jBY9cA7wSqMPPCC64jVqw9aA)(NU32* vr, NU64 n);
N_LIB_PRIVATE N_NIMCALL(void, X5BX5Deq___tT1dykjMB9c0G0E9bG0MLrfw)(NI32* vr, NU64 n, NI32 val);
N_LIB_PRIVATE N_NOINLINE(void, raiseIndexError2)(NI i, NI n);
N_LIB_PRIVATE N_NIMCALL(void, filteredLog__lw3suybQ5yRVSDxTrBDwWg)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* instance, tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg status, int categoryIndex, NCSTRING message);
N_NIMCALL(NimStringDesc*, rawNewString)(NI cap);
static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src);
static N_INLINE(void, copyMem__i80o3k0SgEI5gTRCzYdyWAsystem)(void* dest, void* source, NI size);
static N_INLINE(void, nimCopyMem)(void* dest, void* source, NI size);
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, resizeString)(NimStringDesc* dest, NI addlen);
N_LIB_PRIVATE N_NIMCALL(void, formatValue__C31L3FTGCD9awB6j0rwrtEQ)(NimStringDesc** result, NU32 value, NimStringDesc* specifier);
N_LIB_PRIVATE N_NIMCALL(void, formatValue__FHGegxCkY6EscNTF2OFusw)(NimStringDesc** result, int value, NimStringDesc* specifier);
N_LIB_PRIVATE N_NIMCALL(NI32, X5BX5D___JS6FVIsrpB7DXYGSQvzqew)(NI32* vr, NU64 n);
static N_INLINE(NCSTRING, nimToCStringConv)(NimStringDesc* s);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetBoolean)(void* c, NU32* vr, size_t nvr, NI32* value);
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, copyString)(NimStringDesc* src);
N_LIB_PRIVATE N_NIMCALL(void, formatValue__3zjq9csYPBcIN7AqvyU5ZLA)(NimStringDesc** result, NimStringDesc* value, NimStringDesc* specifier);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetString)(void* c, NU32* vr, size_t nvr, NCSTRING* value);
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, addChar)(NimStringDesc* s, NIM_CHAR c);

/* section: NIM_merge_DATA */
STRING_LITERAL(TM__Z1FzpCk17EkFUBsDcGf8BA_2, "fmi2GetInteger: #i", 18);
STRING_LITERAL(TM__Z1FzpCk17EkFUBsDcGf8BA_3, "# = ", 4);
STRING_LITERAL(TM__Z1FzpCk17EkFUBsDcGf8BA_4, "true", 4);
STRING_LITERAL(TM__Z1FzpCk17EkFUBsDcGf8BA_5, "false", 5);
STRING_LITERAL(TM__Z1FzpCk17EkFUBsDcGf8BA_6, "fmi2GetBoolean: #b", 18);
STRING_LITERAL(TM__Z1FzpCk17EkFUBsDcGf8BA_7, "fmi2GetString: #s", 17);
STRING_LITERAL(TM__Z1FzpCk17EkFUBsDcGf8BA_8, "# = \'", 5);
STRING_LITERAL(TM__Z1FzpCk17EkFUBsDcGf8BA_9, "\'", 1);

/* section: NIM_merge_VARS */
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;

/* section: NIM_merge_PROCS */
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
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetReal)(void* c, NU32* vr, size_t nvr, NF* value) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp;
	nimfr_("fmi2GetReal", "/home/jose/src/fmi.nim/src/prueba/getters.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(14, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	comp = ((tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w*) (c));
	nimln_(16, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = invalidState__CFARkdpiNWnLYTkNRNqeNA(comp, "fmi2GetReal", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 4));
		if (!T3_) goto LA4_;
		nimln_(17, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA4_: ;
	nimln_(18, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	{
		NIM_BOOL T8_;
		T8_ = (NIM_BOOL)0;
		T8_ = ((NU64)(((NU) 0)) < (NU64)(nvr));
		if (!(T8_)) goto LA9_;
		T8_ = nullPointer__XwrYJ3AKbQGv6XbV79casAA(comp, "fmi2GetReal", "vr[]", ((void*) (vr)));
		LA9_: ;
		if (!T8_) goto LA10_;
		nimln_(19, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA10_: ;
	nimln_(20, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	{
		NIM_BOOL T14_;
		T14_ = (NIM_BOOL)0;
		T14_ = ((NU64)(((NU) 0)) < (NU64)(nvr));
		if (!(T14_)) goto LA15_;
		T14_ = nullPointer__XwrYJ3AKbQGv6XbV79casAA(comp, "fmi2GetReal", "value[]", ((void*) (value)));
		LA15_: ;
		if (!T14_) goto LA16_;
		nimln_(21, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA16_: ;
	nimln_(22, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	{
		NIM_BOOL T20_;
		T20_ = (NIM_BOOL)0;
		T20_ = ((NU64)(((NU) 0)) < (NU64)(nvr));
		if (!(T20_)) goto LA21_;
		T20_ = (((NI32) 0) < (*comp).isDirtyValues);
		LA21_: ;
		if (!T20_) goto LA22_;
		nimln_(23, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		calculateValues__g4m7TFvWvrc0TdD6kxuUaQ(comp);
		nimln_(24, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		(*comp).isDirtyValues = ((NI32) 0);
	}
	LA22_: ;
	nimln_(35, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
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
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetInteger)(void* c, NU32* vr, size_t nvr, NI32* value) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp;
	nimfr_("fmi2GetInteger", "/home/jose/src/fmi.nim/src/prueba/getters.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(41, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	comp = ((tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w*) (c));
	nimln_(42, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = invalidState__CFARkdpiNWnLYTkNRNqeNA(comp, "fmi2GetInteger", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 4));
		if (!T3_) goto LA4_;
		nimln_(43, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA4_: ;
	nimln_(44, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	{
		NIM_BOOL T8_;
		T8_ = (NIM_BOOL)0;
		T8_ = ((NU64)(((NU) 0)) < (NU64)(nvr));
		if (!(T8_)) goto LA9_;
		T8_ = nullPointer__XwrYJ3AKbQGv6XbV79casAA(comp, "fmi2GetInteger", "vr[]", ((void*) (vr)));
		LA9_: ;
		if (!T8_) goto LA10_;
		nimln_(45, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA10_: ;
	nimln_(46, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	{
		NIM_BOOL T14_;
		T14_ = (NIM_BOOL)0;
		T14_ = ((NU64)(((NU) 0)) < (NU64)(nvr));
		if (!(T14_)) goto LA15_;
		T14_ = nullPointer__XwrYJ3AKbQGv6XbV79casAA(comp, "fmi2GetInteger", "value[]", ((void*) (value)));
		LA15_: ;
		if (!T14_) goto LA16_;
		nimln_(47, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA16_: ;
	nimln_(48, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	{
		NIM_BOOL T20_;
		T20_ = (NIM_BOOL)0;
		T20_ = ((NU64)(((NU) 0)) < (NU64)(nvr));
		if (!(T20_)) goto LA21_;
		T20_ = (((NI32) 0) < (*comp).isDirtyValues);
		LA21_: ;
		if (!T20_) goto LA22_;
		nimln_(49, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		calculateValues__g4m7TFvWvrc0TdD6kxuUaQ(comp);
		nimln_(50, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		(*comp).isDirtyValues = ((NI32) 0);
	}
	LA22_: ;
	{
		NU64 i;
		NU64 colontmp_;
		NU64 res;
		i = (NU64)0;
		colontmp_ = (NU64)0;
		nimln_(52, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		colontmp_ = ((NU64) (nvr));
		nimln_(115, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
		res = 0ULL;
		{
			nimln_(116, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
			while (1) {
				NU32 T33_;
				NimStringDesc* fmtRes;
				NU32 T34_;
				NI32 T35_;
				if (!((NU64)(res) < (NU64)(colontmp_))) goto LA26;
				nimln_(52, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				i = res;
				nimln_(53, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				{
					NU32 T29_;
					NIM_BOOL T30_;
					T29_ = (NU32)0;
					T29_ = X5BX5D___jBY9cA7wSqMPPCC64jVqw9aA(vr, i);
					T30_ = (NIM_BOOL)0;
					T30_ = vrOutOfRange__UhcMWpzGPUrXCK9cH9a20zjg(comp, "fmi2GetInteger", T29_, ((int) 1));
					if (!T30_) goto LA31_;
					nimln_(54, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
					result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
					goto BeforeRet_;
				}
				LA31_: ;
				nimln_(56, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				T33_ = (NU32)0;
				T33_ = X5BX5D___jBY9cA7wSqMPPCC64jVqw9aA(vr, i);
				if ((NU)(T33_) > (NU)(0)){ raiseIndexError2(T33_, 0); }
				X5BX5Deq___tT1dykjMB9c0G0E9bG0MLrfw(value, i, (*comp).i[(T33_)- 0]);
				nimln_(57, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				nimln_(578, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
				nimln_(57, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				fmtRes = rawNewString(((NI) 59));
				fmtRes = resizeString(fmtRes, 18);
appendString(fmtRes, ((NimStringDesc*) &TM__Z1FzpCk17EkFUBsDcGf8BA_2));
				nimln_(550, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/core/macros.nim");
				T34_ = (NU32)0;
				T34_ = X5BX5D___jBY9cA7wSqMPPCC64jVqw9aA(vr, i);
				nimln_(57, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				formatValue__C31L3FTGCD9awB6j0rwrtEQ((&fmtRes), T34_, ((NimStringDesc*) NIM_NIL));
				fmtRes = resizeString(fmtRes, 4);
appendString(fmtRes, ((NimStringDesc*) &TM__Z1FzpCk17EkFUBsDcGf8BA_3));
				nimln_(550, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/core/macros.nim");
				T35_ = (NI32)0;
				T35_ = X5BX5D___JS6FVIsrpB7DXYGSQvzqew(value, i);
				nimln_(57, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				formatValue__FHGegxCkY6EscNTF2OFusw((&fmtRes), T35_, ((NimStringDesc*) NIM_NIL));
				filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0), ((int) 2), nimToCStringConv(fmtRes));
				nimln_(118, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
				res += ((NI) 1);
			} LA26: ;
		}
	}
	nimln_(59, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetBoolean)(void* c, NU32* vr, size_t nvr, NI32* value) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp;
	nimfr_("fmi2GetBoolean", "/home/jose/src/fmi.nim/src/prueba/getters.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(63, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	comp = ((tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w*) (c));
	nimln_(64, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = invalidState__CFARkdpiNWnLYTkNRNqeNA(comp, "fmi2GetBoolean", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 4));
		if (!T3_) goto LA4_;
		nimln_(65, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA4_: ;
	nimln_(66, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	{
		NIM_BOOL T8_;
		T8_ = (NIM_BOOL)0;
		T8_ = ((NU64)(((NU) 0)) < (NU64)(nvr));
		if (!(T8_)) goto LA9_;
		T8_ = nullPointer__XwrYJ3AKbQGv6XbV79casAA(comp, "fmi2GetBoolean", "vr[]", ((void*) (vr)));
		LA9_: ;
		if (!T8_) goto LA10_;
		nimln_(67, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA10_: ;
	nimln_(68, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	{
		NIM_BOOL T14_;
		T14_ = (NIM_BOOL)0;
		T14_ = ((NU64)(((NU) 0)) < (NU64)(nvr));
		if (!(T14_)) goto LA15_;
		T14_ = nullPointer__XwrYJ3AKbQGv6XbV79casAA(comp, "fmi2GetBoolean", "value[]", ((void*) (value)));
		LA15_: ;
		if (!T14_) goto LA16_;
		nimln_(69, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA16_: ;
	nimln_(70, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	{
		NIM_BOOL T20_;
		T20_ = (NIM_BOOL)0;
		T20_ = ((NU64)(((NU) 0)) < (NU64)(nvr));
		if (!(T20_)) goto LA21_;
		T20_ = (((NI32) 0) < (*comp).isDirtyValues);
		LA21_: ;
		if (!T20_) goto LA22_;
		nimln_(71, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		calculateValues__g4m7TFvWvrc0TdD6kxuUaQ(comp);
		nimln_(72, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		(*comp).isDirtyValues = ((NI32) 0);
	}
	LA22_: ;
	{
		NU64 i;
		NU64 colontmp_;
		NU64 res;
		i = (NU64)0;
		colontmp_ = (NU64)0;
		nimln_(74, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		colontmp_ = ((NU64) (nvr));
		nimln_(115, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
		res = 0ULL;
		{
			nimln_(116, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
			while (1) {
				NU32 T33_;
				NimStringDesc* tmp;
				NimStringDesc* fmtRes;
				NU32 T40_;
				if (!((NU64)(res) < (NU64)(colontmp_))) goto LA26;
				nimln_(74, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				i = res;
				nimln_(75, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				{
					NU32 T29_;
					NIM_BOOL T30_;
					T29_ = (NU32)0;
					T29_ = X5BX5D___jBY9cA7wSqMPPCC64jVqw9aA(vr, i);
					T30_ = (NIM_BOOL)0;
					T30_ = vrOutOfRange__UhcMWpzGPUrXCK9cH9a20zjg(comp, "fmi2GetBoolean", T29_, ((int) 0));
					if (!T30_) goto LA31_;
					nimln_(76, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
					result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
					goto BeforeRet_;
				}
				LA31_: ;
				nimln_(77, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				T33_ = (NU32)0;
				T33_ = X5BX5D___jBY9cA7wSqMPPCC64jVqw9aA(vr, i);
				X5BX5Deq___tT1dykjMB9c0G0E9bG0MLrfw(value, i, (*comp).b[T33_]);
				tmp = (NimStringDesc*)0;
				nimln_(79, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				{
					NI32 T36_;
					T36_ = (NI32)0;
					T36_ = X5BX5D___JS6FVIsrpB7DXYGSQvzqew(value, i);
					if (!(((NI32) 0) < T36_)) goto LA37_;
					nimln_(80, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
					tmp = copyString(((NimStringDesc*) &TM__Z1FzpCk17EkFUBsDcGf8BA_4));
				}
				goto LA34_;
				LA37_: ;
				{
					nimln_(82, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
					tmp = copyString(((NimStringDesc*) &TM__Z1FzpCk17EkFUBsDcGf8BA_5));
				}
				LA34_: ;
				nimln_(84, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				nimln_(578, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
				nimln_(84, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				fmtRes = rawNewString(((NI) 54));
				fmtRes = resizeString(fmtRes, 18);
appendString(fmtRes, ((NimStringDesc*) &TM__Z1FzpCk17EkFUBsDcGf8BA_6));
				nimln_(550, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/core/macros.nim");
				T40_ = (NU32)0;
				T40_ = X5BX5D___jBY9cA7wSqMPPCC64jVqw9aA(vr, i);
				nimln_(84, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				formatValue__C31L3FTGCD9awB6j0rwrtEQ((&fmtRes), T40_, ((NimStringDesc*) NIM_NIL));
				fmtRes = resizeString(fmtRes, 4);
appendString(fmtRes, ((NimStringDesc*) &TM__Z1FzpCk17EkFUBsDcGf8BA_3));
				formatValue__3zjq9csYPBcIN7AqvyU5ZLA((&fmtRes), tmp, ((NimStringDesc*) NIM_NIL));
				filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0), ((int) 2), nimToCStringConv(fmtRes));
				nimln_(118, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
				res += ((NI) 1);
			} LA26: ;
		}
	}
	nimln_(86, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetString)(void* c, NU32* vr, size_t nvr, NCSTRING* value) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp;
	NU32* v;
	NCSTRING* s;
	NCSTRING** val;
	nimfr_("fmi2GetString", "/home/jose/src/fmi.nim/src/prueba/getters.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(90, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	comp = ((tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w*) (c));
	nimln_(91, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = invalidState__CFARkdpiNWnLYTkNRNqeNA(comp, "fmi2GetString", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 4));
		if (!T3_) goto LA4_;
		nimln_(92, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA4_: ;
	nimln_(93, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	{
		NIM_BOOL T8_;
		T8_ = (NIM_BOOL)0;
		T8_ = ((NU64)(((NU) 0)) < (NU64)(nvr));
		if (!(T8_)) goto LA9_;
		T8_ = nullPointer__XwrYJ3AKbQGv6XbV79casAA(comp, "fmi2GetString", "vr[]", ((void*) (vr)));
		LA9_: ;
		if (!T8_) goto LA10_;
		nimln_(94, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA10_: ;
	nimln_(95, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	{
		NIM_BOOL T14_;
		T14_ = (NIM_BOOL)0;
		T14_ = ((NU64)(((NU) 0)) < (NU64)(nvr));
		if (!(T14_)) goto LA15_;
		T14_ = nullPointer__XwrYJ3AKbQGv6XbV79casAA(comp, "fmi2GetString", "value[]", ((void*) (value)));
		LA15_: ;
		if (!T14_) goto LA16_;
		nimln_(96, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA16_: ;
	nimln_(97, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	{
		NIM_BOOL T20_;
		T20_ = (NIM_BOOL)0;
		T20_ = ((NU64)(((NU) 0)) < (NU64)(nvr));
		if (!(T20_)) goto LA21_;
		T20_ = (((NI32) 0) < (*comp).isDirtyValues);
		LA21_: ;
		if (!T20_) goto LA22_;
		nimln_(98, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		calculateValues__g4m7TFvWvrc0TdD6kxuUaQ(comp);
		nimln_(99, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		(*comp).isDirtyValues = ((NI32) 0);
	}
	LA22_: ;
	nimln_(100, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	v = ((NU32*) (vr));
	nimln_(101, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	s = ((NCSTRING*) ((*comp).s));
	nimln_(102, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	val = ((NCSTRING**) (value));
	{
		NU64 i;
		NU64 colontmp_;
		NU64 res;
		i = (NU64)0;
		colontmp_ = (NU64)0;
		nimln_(103, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
		colontmp_ = ((NU64) (nvr));
		nimln_(115, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
		res = 0ULL;
		{
			nimln_(116, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
			while (1) {
				NimStringDesc* fmtRes;
				NU32 T33_;
				if (!((NU64)(res) < (NU64)(colontmp_))) goto LA26;
				nimln_(103, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				i = res;
				nimln_(104, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				{
					NU32 T29_;
					NIM_BOOL T30_;
					T29_ = (NU32)0;
					T29_ = X5BX5D___jBY9cA7wSqMPPCC64jVqw9aA(vr, i);
					T30_ = (NIM_BOOL)0;
					T30_ = vrOutOfRange__UhcMWpzGPUrXCK9cH9a20zjg(comp, "fmi2GetString", T29_, ((int) 0));
					if (!T30_) goto LA31_;
					nimln_(105, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
					result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
					goto BeforeRet_;
				}
				LA31_: ;
				nimln_(108, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				val[i] = (&s[v[i]]);
				nimln_(109, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				nimln_(578, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
				nimln_(109, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				fmtRes = rawNewString(((NI) 60));
				fmtRes = resizeString(fmtRes, 17);
appendString(fmtRes, ((NimStringDesc*) &TM__Z1FzpCk17EkFUBsDcGf8BA_7));
				nimln_(550, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/core/macros.nim");
				T33_ = (NU32)0;
				T33_ = X5BX5D___jBY9cA7wSqMPPCC64jVqw9aA(vr, i);
				nimln_(109, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				formatValue__C31L3FTGCD9awB6j0rwrtEQ((&fmtRes), T33_, ((NimStringDesc*) NIM_NIL));
				fmtRes = resizeString(fmtRes, 5);
appendString(fmtRes, ((NimStringDesc*) &TM__Z1FzpCk17EkFUBsDcGf8BA_8));
				nimln_(621, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
				fmtRes = addChar(fmtRes, (*value)[i]);
				nimln_(109, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
				fmtRes = resizeString(fmtRes, 1);
appendString(fmtRes, ((NimStringDesc*) &TM__Z1FzpCk17EkFUBsDcGf8BA_9));
				filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0), ((int) 2), nimToCStringConv(fmtRes));
				nimln_(118, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
				res += ((NI) 1);
			} LA26: ;
		}
	}
	nimln_(111, "/home/jose/src/fmi.nim/src/prueba/getters.nim");
	result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
