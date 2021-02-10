/* Generated by Nim Compiler v1.4.2 */
/*   (c) 2020 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Linux, amd64, gcc */
/* Command for C compiler:
   gcc -c  -w -fmax-errors=3  -fPIC  -I/home/jose/.choosenim/toolchains/nim-1.4.2/lib -I/home/jose/src/fmi.nim/src/prueba -o /home/jose/src/fmi.nim/src/prueba/.cache/@mcommon.nim.c.o /home/jose/src/fmi.nim/src/prueba/.cache/@mcommon.nim.c */
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
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;

/* section: NIM_merge_TYPES */
typedef NU8 tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg;
typedef NI32 tyArray__zBLFLWYYZ1F9cWZALii7NkQ[1];
typedef NU8 tyEnum_fmi2Type__fvJT52iMO9bHIEUsKT6J0Ew;
typedef NI32 tyArray__48IqrAYoce9a50c9bgEbuWGw[4];
typedef NU16 tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg;
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
typedef NimStringDesc* tyArray__nHXaesL0DJZHyVS07ARPRA[1];
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

/* section: NIM_merge_PROC_HEADERS */
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2SetupExperiment)(void* c, NI32 toleranceDefined, NF tolerance, NF startTime, NI32 stopTimeDefined, NF stopTime);
static N_INLINE(void, nimZeroMem)(void* p, NI size);
static N_INLINE(void, nimSetMem__zxfKBYntu9cBapkhrCOk1fgmemory)(void* a, int v, NI size);
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, reprAny)(void* p, TNimType* typ);
N_LIB_PRIVATE N_NIMCALL(void, echoBinSafe)(NimStringDesc** args, NI argsLen_0);
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, invalidState__CFARkdpiNWnLYTkNRNqeNA)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp, NCSTRING f, tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg statesExpected);
N_LIB_PRIVATE N_NIMCALL(void, filteredLog__lw3suybQ5yRVSDxTrBDwWg)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* instance, tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg status, int categoryIndex, NCSTRING message);
N_NIMCALL(NimStringDesc*, rawNewString)(NI cap);
static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src);
static N_INLINE(void, copyMem__i80o3k0SgEI5gTRCzYdyWAsystem)(void* dest, void* source, NI size);
static N_INLINE(void, nimCopyMem)(void* dest, void* source, NI size);
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, resizeString)(NimStringDesc* dest, NI addlen);
N_LIB_PRIVATE N_NIMCALL(void, formatValue__FHGegxCkY6EscNTF2OFusw)(NimStringDesc** result, int value, NimStringDesc* specifier);
N_LIB_PRIVATE N_NIMCALL(void, formatValue__F6AoShDCcKwxHedHsIa3bQ)(NimStringDesc** result, NF value, NimStringDesc* specifier);
static N_INLINE(NCSTRING, nimToCStringConv)(NimStringDesc* s);
static N_INLINE(void, nimFrame)(TFrame* s);
N_LIB_PRIVATE N_NOINLINE(void, callDepthLimitReached__mMRdr4sgmnykA9aWeM9aDZlw)(void);
static N_INLINE(void, popFrame)(void);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2EnterInitializationMode)(void* c);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2ExitInitializationMode)(void* c);
N_LIB_PRIVATE N_NIMCALL(void, calculateValues__g4m7TFvWvrc0TdD6kxuUaQ)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2Terminate)(void* c);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2Reset)(void* c);
N_LIB_PRIVATE N_NIMCALL(void, setStartValues__g4m7TFvWvrc0TdD6kxuUaQ_2)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetFMUstate)(void* c, void** FMUstate);
N_LIB_PRIVATE N_NIMCALL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, unsupportedFunction__s2gyI28xaU28T9acdoCxbzg)(void* c, NCSTRING fName, tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg statesExpected);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2SetFMUstate)(void* c, void** FMUstate);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2FreeFMUstate)(void* c, void** FMUstate);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2SerializedFMUstateSize)(void* c, void** FMUstate, size_t* size);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2SerializeFMUstate)(void* c, void* FMUstate, NIM_CHAR* serializedState, size_t size);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2DeSerializeFMUstate)(void* c, NIM_CHAR* serializedState, size_t size, void** FMUstate);
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetDirectionalDerivative)(void* c, NU32* vUnknown_ref, size_t nUnknown, NU32* vKnown_ref, size_t nKnown, NF* dvKnown, NF* dvUnknown);

/* section: NIM_merge_DATA */
extern TNimType NTI__S9agCYBinaYZnGWcjTdxclg_;
STRING_LITERAL(TM__AZJHBAzoQYZ8EayTGp7UeA_3, "INVALID STATE!!!", 16);
static NIM_CONST tyArray__nHXaesL0DJZHyVS07ARPRA TM__AZJHBAzoQYZ8EayTGp7UeA_2 = {((NimStringDesc*) &TM__AZJHBAzoQYZ8EayTGp7UeA_3)}
;
STRING_LITERAL(TM__AZJHBAzoQYZ8EayTGp7UeA_4, "fmi2SetupExperiment: toleranceDefined=", 38);
STRING_LITERAL(TM__AZJHBAzoQYZ8EayTGp7UeA_5, " tolerance=", 11);

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
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2SetupExperiment)(void* c, NI32 toleranceDefined, NF tolerance, NF startTime, NI32 stopTimeDefined, NF stopTime) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w comp;
	union { void* source; tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w dest; } LOC1;
	tyArray__nHXaesL0DJZHyVS07ARPRA T2_;
	NimStringDesc* fmtRes;
	nimfr_("fmi2SetupExperiment", "/home/jose/src/fmi.nim/src/prueba/common.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(15, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	LOC1.source = c;
	comp = LOC1.dest;
	nimln_(16, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	nimZeroMem((void*)T2_, sizeof(tyArray__nHXaesL0DJZHyVS07ARPRA));
	T2_[0] = reprAny(comp.GUID, (&NTI__S9agCYBinaYZnGWcjTdxclg_));
	echoBinSafe(T2_, 1);
	nimln_(17, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	{
		NIM_BOOL T5_;
		T5_ = (NIM_BOOL)0;
		T5_ = invalidState__CFARkdpiNWnLYTkNRNqeNA(((tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w*) (c)), "fmi2SetupExperiment", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 2));
		if (!T5_) goto LA6_;
		nimln_(18, "/home/jose/src/fmi.nim/src/prueba/common.nim");
		echoBinSafe(TM__AZJHBAzoQYZ8EayTGp7UeA_2, 1);
		nimln_(19, "/home/jose/src/fmi.nim/src/prueba/common.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA6_: ;
	nimln_(20, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	nimln_(578, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strformat.n"
"im");
	nimln_(21, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	fmtRes = rawNewString(((NI) 98));
	fmtRes = resizeString(fmtRes, 38);
appendString(fmtRes, ((NimStringDesc*) &TM__AZJHBAzoQYZ8EayTGp7UeA_4));
	formatValue__FHGegxCkY6EscNTF2OFusw((&fmtRes), toleranceDefined, ((NimStringDesc*) NIM_NIL));
	fmtRes = resizeString(fmtRes, 11);
appendString(fmtRes, ((NimStringDesc*) &TM__AZJHBAzoQYZ8EayTGp7UeA_5));
	formatValue__F6AoShDCcKwxHedHsIa3bQ((&fmtRes), tolerance, ((NimStringDesc*) NIM_NIL));
	nimln_(20, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	filteredLog__lw3suybQ5yRVSDxTrBDwWg((&comp), ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0), ((int) 2), nimToCStringConv(fmtRes));
	nimln_(22, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	comp.time = startTime;
	nimln_(23, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2EnterInitializationMode)(void* c) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp;
	nimfr_("fmi2EnterInitializationMode", "/home/jose/src/fmi.nim/src/prueba/common.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(27, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	comp = ((tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w*) (c));
	nimln_(28, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = invalidState__CFARkdpiNWnLYTkNRNqeNA(comp, "fmi2EnterInitializationMode", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 2));
		if (!T3_) goto LA4_;
		nimln_(29, "/home/jose/src/fmi.nim/src/prueba/common.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA4_: ;
	nimln_(30, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0), ((int) 2), "fmi2EnterInitializationMode");
	nimln_(32, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	(*comp).state = ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 4);
	nimln_(33, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2ExitInitializationMode)(void* c) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp;
	nimfr_("fmi2ExitInitializationMode", "/home/jose/src/fmi.nim/src/prueba/common.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(36, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	comp = ((tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w*) (c));
	nimln_(37, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = invalidState__CFARkdpiNWnLYTkNRNqeNA(comp, "fmi2ExitInitializationMode", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 4));
		if (!T3_) goto LA4_;
		nimln_(38, "/home/jose/src/fmi.nim/src/prueba/common.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA4_: ;
	nimln_(39, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0), ((int) 2), "fmi2ExitInitializationMode");
	nimln_(43, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	{
		if (!(((NI32) 0) < (*comp).isDirtyValues)) goto LA8_;
		nimln_(44, "/home/jose/src/fmi.nim/src/prueba/common.nim");
		calculateValues__g4m7TFvWvrc0TdD6kxuUaQ(comp);
		nimln_(45, "/home/jose/src/fmi.nim/src/prueba/common.nim");
		(*comp).isDirtyValues = ((NI32) 0);
	}
	LA8_: ;
	nimln_(47, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	{
		if (!((*comp).type_0 == ((tyEnum_fmi2Type__fvJT52iMO9bHIEUsKT6J0Ew) 0))) goto LA12_;
		nimln_(48, "/home/jose/src/fmi.nim/src/prueba/common.nim");
		(*comp).state = ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 8);
		nimln_(49, "/home/jose/src/fmi.nim/src/prueba/common.nim");
		(*comp).isNewEventIteration = ((NI32) 1);
	}
	goto LA10_;
	LA12_: ;
	{
		nimln_(52, "/home/jose/src/fmi.nim/src/prueba/common.nim");
		(*comp).state = ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 32);
	}
	LA10_: ;
	nimln_(53, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2Terminate)(void* c) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp;
	nimfr_("fmi2Terminate", "/home/jose/src/fmi.nim/src/prueba/common.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(57, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	comp = ((tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w*) (c));
	nimln_(58, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = invalidState__CFARkdpiNWnLYTkNRNqeNA(comp, "fmi2Terminate", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 8));
		if (!T3_) goto LA4_;
		nimln_(59, "/home/jose/src/fmi.nim/src/prueba/common.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA4_: ;
	nimln_(60, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0), ((int) 2), "fmi2Terminate");
	nimln_(62, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	(*comp).state = ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 512);
	nimln_(63, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2Reset)(void* c) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp;
	nimfr_("fmi2Reset", "/home/jose/src/fmi.nim/src/prueba/common.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(67, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	comp = ((tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w*) (c));
	nimln_(68, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = invalidState__CFARkdpiNWnLYTkNRNqeNA(comp, "fmi2Reset", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 2));
		if (!T3_) goto LA4_;
		nimln_(69, "/home/jose/src/fmi.nim/src/prueba/common.nim");
		result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3);
		goto BeforeRet_;
	}
	LA4_: ;
	nimln_(70, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	filteredLog__lw3suybQ5yRVSDxTrBDwWg(comp, ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0), ((int) 2), "fmi2Reset");
	nimln_(72, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	(*comp).state = ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 2);
	nimln_(73, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	setStartValues__g4m7TFvWvrc0TdD6kxuUaQ_2(comp);
	nimln_(74, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	(*comp).isDirtyValues = ((NI32) 1);
	nimln_(75, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	result = ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 0);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetFMUstate)(void* c, void** FMUstate) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	nimfr_("fmi2GetFMUstate", "/home/jose/src/fmi.nim/src/prueba/common.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(83, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	result = unsupportedFunction__s2gyI28xaU28T9acdoCxbzg(c, "fmi2GetFMUstate", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 2));
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2SetFMUstate)(void* c, void** FMUstate) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	nimfr_("fmi2SetFMUstate", "/home/jose/src/fmi.nim/src/prueba/common.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(86, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	result = unsupportedFunction__s2gyI28xaU28T9acdoCxbzg(c, "fmi2SetFMUstate", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 2));
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2FreeFMUstate)(void* c, void** FMUstate) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	nimfr_("fmi2FreeFMUstate", "/home/jose/src/fmi.nim/src/prueba/common.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(89, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	result = unsupportedFunction__s2gyI28xaU28T9acdoCxbzg(c, "fmi2FreeFMUstate", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 2));
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2SerializedFMUstateSize)(void* c, void** FMUstate, size_t* size) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	nimfr_("fmi2SerializedFMUstateSize", "/home/jose/src/fmi.nim/src/prueba/common.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(93, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	result = unsupportedFunction__s2gyI28xaU28T9acdoCxbzg(c, "fmi2SerializedFMUstateSize", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 2));
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2SerializeFMUstate)(void* c, void* FMUstate, NIM_CHAR* serializedState, size_t size) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	nimfr_("fmi2SerializeFMUstate", "/home/jose/src/fmi.nim/src/prueba/common.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(97, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	result = unsupportedFunction__s2gyI28xaU28T9acdoCxbzg(c, "fmi2SerializeFMUstate", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 2));
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2DeSerializeFMUstate)(void* c, NIM_CHAR* serializedState, size_t size, void** FMUstate) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	nimfr_("fmi2DeSerializeFMUstate", "/home/jose/src/fmi.nim/src/prueba/common.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(101, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	result = unsupportedFunction__s2gyI28xaU28T9acdoCxbzg(c, "fmi2DeSerializeFMUstate", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 2));
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_EXPORT N_CDECL(tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg, fmi2GetDirectionalDerivative)(void* c, NU32* vUnknown_ref, size_t nUnknown, NU32* vKnown_ref, size_t nKnown, NF* dvKnown, NF* dvUnknown) {
	tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg result;
	nimfr_("fmi2GetDirectionalDerivative", "/home/jose/src/fmi.nim/src/prueba/common.nim");
{	result = (tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg)0;
	nimln_(110, "/home/jose/src/fmi.nim/src/prueba/common.nim");
	result = unsupportedFunction__s2gyI28xaU28T9acdoCxbzg(c, "fmi2GetDirectionalDerivative", ((tyEnum_ModelState__ghm8c7EoWwf9a6hsxvVwGHg) 4));
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
