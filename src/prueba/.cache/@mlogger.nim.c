/* Generated by Nim Compiler v1.4.2 */
/*   (c) 2020 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Linux, amd64, gcc */
/* Command for C compiler:
   gcc -c  -w -fmax-errors=3  -fPIC  -I/home/jose/.choosenim/toolchains/nim-1.4.2/lib -I/home/jose/src/fmi.nim/src/prueba -o /home/jose/src/fmi.nim/src/prueba/.cache/@mlogger.nim.c.o /home/jose/src/fmi.nim/src/prueba/.cache/@mlogger.nim.c */
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
typedef struct tySequence__sM4lkSb7zS6F7OVMvW9cffQ tySequence__sM4lkSb7zS6F7OVMvW9cffQ;
typedef struct TGenericSeq TGenericSeq;
typedef struct NimStringDesc NimStringDesc;
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
typedef struct tyObject_Cell__1zcF9cV8XIAtbN8h5HRUB8g tyObject_Cell__1zcF9cV8XIAtbN8h5HRUB8g;
typedef struct tyObject_CellSeq__Axo1XVm9aaQueTOldv8le5w tyObject_CellSeq__Axo1XVm9aaQueTOldv8le5w;
typedef struct tyObject_GcHeap__1TRH1TZMaVZTnLNcIHuNFQ tyObject_GcHeap__1TRH1TZMaVZTnLNcIHuNFQ;
typedef struct tyObject_GcStack__7fytPA5bBsob6See21YMRA tyObject_GcStack__7fytPA5bBsob6See21YMRA;
typedef struct tyObject_MemRegion__x81NhDv59b8ercDZ9bi85jyg tyObject_MemRegion__x81NhDv59b8ercDZ9bi85jyg;
typedef struct tyObject_SmallChunk__tXn60W2f8h3jgAYdEmy5NQ tyObject_SmallChunk__tXn60W2f8h3jgAYdEmy5NQ;
typedef struct tyObject_BigChunk__Rv9c70Uhp2TytkX7eH78qEg tyObject_BigChunk__Rv9c70Uhp2TytkX7eH78qEg;
typedef struct tyObject_LLChunk__XsENErzHIZV9bhvyJx56wGw tyObject_LLChunk__XsENErzHIZV9bhvyJx56wGw;
typedef struct tyObject_IntSet__EZObFrE3NC9bIb3YMkY9crZA tyObject_IntSet__EZObFrE3NC9bIb3YMkY9crZA;
typedef struct tyObject_Trunk__W0r8S0Y3UGke6T9bIUWnnuw tyObject_Trunk__W0r8S0Y3UGke6T9bIUWnnuw;
typedef struct tyObject_AvlNode__IaqjtwKhxLEpvDS9bct9blEw tyObject_AvlNode__IaqjtwKhxLEpvDS9bct9blEw;
typedef struct tyObject_HeapLinks__PDV1HBZ8CQSQJC9aOBFNRSg tyObject_HeapLinks__PDV1HBZ8CQSQJC9aOBFNRSg;
typedef struct tyTuple__ujsjpB2O9cjj3uDHsXbnSzg tyTuple__ujsjpB2O9cjj3uDHsXbnSzg;
typedef struct tyObject_GcStat__0RwLoVBHZPfUAcLczmfQAg tyObject_GcStat__0RwLoVBHZPfUAcLczmfQAg;
typedef struct tyObject_CellSet__jG87P0AI9aZtss9ccTYBIISQ tyObject_CellSet__jG87P0AI9aZtss9ccTYBIISQ;
typedef struct tyObject_PageDesc__fublkgIY4LG3mT51LU2WHg tyObject_PageDesc__fublkgIY4LG3mT51LU2WHg;

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
struct TGenericSeq {
NI len;
NI reserved;
};
struct NimStringDesc {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
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
struct tyObject_Cell__1zcF9cV8XIAtbN8h5HRUB8g {
NI refcount;
TNimType* typ;
};
struct tyObject_GcStack__7fytPA5bBsob6See21YMRA {
void* bottom;
};
struct tyObject_CellSeq__Axo1XVm9aaQueTOldv8le5w {
NI len;
NI cap;
tyObject_Cell__1zcF9cV8XIAtbN8h5HRUB8g** d;
};
typedef tyObject_SmallChunk__tXn60W2f8h3jgAYdEmy5NQ* tyArray__SPr7N6UKfuF549bNPiUvSRw[256];
typedef NU32 tyArray__BHbOSqU1t9b3Gt7K2c6fQig[24];
typedef tyObject_BigChunk__Rv9c70Uhp2TytkX7eH78qEg* tyArray__N1u1nqOgmuJN9cSZrnMHgOQ[32];
typedef tyArray__N1u1nqOgmuJN9cSZrnMHgOQ tyArray__B6durA4ZCi1xjJvRtyYxMg[24];
typedef tyObject_Trunk__W0r8S0Y3UGke6T9bIUWnnuw* tyArray__lh2A89ahMmYg9bCmpVaplLbA[256];
struct tyObject_IntSet__EZObFrE3NC9bIb3YMkY9crZA {
tyArray__lh2A89ahMmYg9bCmpVaplLbA data;
};
typedef tyObject_AvlNode__IaqjtwKhxLEpvDS9bct9blEw* tyArray__0aOLqZchNi8nWtMTi8ND8w[2];
struct tyObject_AvlNode__IaqjtwKhxLEpvDS9bct9blEw {
tyArray__0aOLqZchNi8nWtMTi8ND8w link;
NI key;
NI upperBound;
NI level;
};
struct tyTuple__ujsjpB2O9cjj3uDHsXbnSzg {
tyObject_BigChunk__Rv9c70Uhp2TytkX7eH78qEg* Field0;
NI Field1;
};
typedef tyTuple__ujsjpB2O9cjj3uDHsXbnSzg tyArray__LzOv2eCDGiceMKQstCLmhw[30];
struct tyObject_HeapLinks__PDV1HBZ8CQSQJC9aOBFNRSg {
NI len;
tyArray__LzOv2eCDGiceMKQstCLmhw chunks;
tyObject_HeapLinks__PDV1HBZ8CQSQJC9aOBFNRSg* next;
};
struct tyObject_MemRegion__x81NhDv59b8ercDZ9bi85jyg {
NI minLargeObj;
NI maxLargeObj;
tyArray__SPr7N6UKfuF549bNPiUvSRw freeSmallChunks;
NU32 flBitmap;
tyArray__BHbOSqU1t9b3Gt7K2c6fQig slBitmap;
tyArray__B6durA4ZCi1xjJvRtyYxMg matrix;
tyObject_LLChunk__XsENErzHIZV9bhvyJx56wGw* llmem;
NI currMem;
NI maxMem;
NI freeMem;
NI occ;
NI lastSize;
tyObject_IntSet__EZObFrE3NC9bIb3YMkY9crZA chunkStarts;
tyObject_AvlNode__IaqjtwKhxLEpvDS9bct9blEw* root;
tyObject_AvlNode__IaqjtwKhxLEpvDS9bct9blEw* deleted;
tyObject_AvlNode__IaqjtwKhxLEpvDS9bct9blEw* last;
tyObject_AvlNode__IaqjtwKhxLEpvDS9bct9blEw* freeAvlNodes;
NIM_BOOL locked;
NIM_BOOL blockChunkSizeIncrease;
NI nextChunkSize;
tyObject_AvlNode__IaqjtwKhxLEpvDS9bct9blEw bottomData;
tyObject_HeapLinks__PDV1HBZ8CQSQJC9aOBFNRSg heapLinks;
};
struct tyObject_GcStat__0RwLoVBHZPfUAcLczmfQAg {
NI stackScans;
NI cycleCollections;
NI maxThreshold;
NI maxStackSize;
NI maxStackCells;
NI cycleTableSize;
NI64 maxPause;
};
struct tyObject_CellSet__jG87P0AI9aZtss9ccTYBIISQ {
NI counter;
NI max;
tyObject_PageDesc__fublkgIY4LG3mT51LU2WHg* head;
tyObject_PageDesc__fublkgIY4LG3mT51LU2WHg** data;
};
struct tyObject_GcHeap__1TRH1TZMaVZTnLNcIHuNFQ {
tyObject_GcStack__7fytPA5bBsob6See21YMRA stack;
NI cycleThreshold;
NI zctThreshold;
tyObject_CellSeq__Axo1XVm9aaQueTOldv8le5w zct;
tyObject_CellSeq__Axo1XVm9aaQueTOldv8le5w decStack;
tyObject_CellSeq__Axo1XVm9aaQueTOldv8le5w tempStack;
NI recGcLock;
tyObject_MemRegion__x81NhDv59b8ercDZ9bi85jyg region;
tyObject_GcStat__0RwLoVBHZPfUAcLczmfQAg stat;
tyObject_CellSet__jG87P0AI9aZtss9ccTYBIISQ marked;
tyObject_CellSeq__Axo1XVm9aaQueTOldv8le5w additionalRoots;
NI gcThreadId;
};
typedef N_CLOSURE_PTR(void, TM__AK9ckCksWPE1OuNZoPFGU5g_6) (void* a1, NCSTRING a2, tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg a3, NCSTRING a4, NCSTRING a5);

/* section: NIM_merge_SEQ_TYPES */
struct tySequence__sM4lkSb7zS6F7OVMvW9cffQ {
  TGenericSeq Sup;
  NimStringDesc* data[SEQ_DECL_SIZE];
};

/* section: NIM_merge_PROC_HEADERS */
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, isCategoryLogged__9a8x6ZVL34qUFAzcWYHvH2g)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp, int categoryIndex);
N_LIB_PRIVATE N_NOINLINE(void, raiseIndexError2)(NI i, NI n);
static N_INLINE(void, nimFrame)(TFrame* s);
N_LIB_PRIVATE N_NOINLINE(void, callDepthLimitReached__mMRdr4sgmnykA9aWeM9aDZlw)(void);
static N_INLINE(void, popFrame)(void);
static N_INLINE(void, nimZeroMem)(void* p, NI size);
static N_INLINE(void, nimSetMem__zxfKBYntu9cBapkhrCOk1fgmemory)(void* a, int v, NI size);
N_LIB_PRIVATE N_NIMCALL(NCSTRING, logCategoriesNames__fBTDHtIu1eEelQgqP4O36Q)(int idx);
N_LIB_PRIVATE N_NIMCALL(void*, newSeq)(TNimType* typ, NI len);
N_LIB_PRIVATE N_NIMCALL(void, nimGCvisit)(void* d, NI op);
static N_NIMCALL(void, Marker_tySequence__sM4lkSb7zS6F7OVMvW9cffQ)(void* p, NI op);
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, copyStringRC1)(NimStringDesc* src);
static N_INLINE(void, nimGCunrefNoCycle)(void* p);
static N_INLINE(void, decRef__AT1eRuflKWyTTBdLjEDZbg_2system)(tyObject_Cell__1zcF9cV8XIAtbN8h5HRUB8g* c);
static N_INLINE(NI, minuspercent___dgYAo7RfdUVVpvkfKDym8wsystem)(NI x, NI y);
static N_INLINE(NIM_BOOL, ltpercent___hPljn3JCDQ00ua1R07X9bxQsystem)(NI x, NI y);
static N_INLINE(void, rtlAddZCT__AT1eRuflKWyTTBdLjEDZbg_3system)(tyObject_Cell__1zcF9cV8XIAtbN8h5HRUB8g* c);
N_LIB_PRIVATE N_NOINLINE(void, addZCT__Y66tOYFjgwJ0k4aLz4bc0Q)(tyObject_CellSeq__Axo1XVm9aaQueTOldv8le5w* s, tyObject_Cell__1zcF9cV8XIAtbN8h5HRUB8g* c);
static N_INLINE(tyObject_Cell__1zcF9cV8XIAtbN8h5HRUB8g*, usrToCell__QFQqcLB3lgOdwipkv9a60xwsystem)(void* usr);
static N_INLINE(NCSTRING, nimToCStringConv)(NimStringDesc* s);

/* section: NIM_merge_DATA */
extern TNimType NTI__77mFvmsOLKik79ci2hXkHEg_;
N_LIB_PRIVATE TNimType NTI__sM4lkSb7zS6F7OVMvW9cffQ_;
STRING_LITERAL(TM__AK9ckCksWPE1OuNZoPFGU5g_2, "logAll", 6);
STRING_LITERAL(TM__AK9ckCksWPE1OuNZoPFGU5g_3, "logError", 8);
STRING_LITERAL(TM__AK9ckCksWPE1OuNZoPFGU5g_4, "logFmiCall", 10);
STRING_LITERAL(TM__AK9ckCksWPE1OuNZoPFGU5g_5, "logEvent", 8);

/* section: NIM_merge_VARS */
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern tyObject_GcHeap__1TRH1TZMaVZTnLNcIHuNFQ gch__IcYaEuuWivYAS86vFMTS3Q;

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
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, isCategoryLogged__9a8x6ZVL34qUFAzcWYHvH2g)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* comp, int categoryIndex) {
	NIM_BOOL result;
	nimfr_("isCategoryLogged", "/home/jose/src/fmi.nim/src/prueba/logger.nim");
{	result = (NIM_BOOL)0;
	nimln_(8, "/home/jose/src/fmi.nim/src/prueba/logger.nim");
	{
		NIM_BOOL T3_;
		NIM_BOOL T5_;
		T3_ = (NIM_BOOL)0;
		T3_ = (categoryIndex < ((NI32) 4));
		if (!(T3_)) goto LA4_;
		T5_ = (NIM_BOOL)0;
		if ((NU)(categoryIndex) > (NU)(3)){ raiseIndexError2(categoryIndex, 3); }
		T5_ = (((NI32) 0) < (*comp).logCategories[(categoryIndex)- 0]);
		if (T5_) goto LA6_;
		T5_ = (((NI32) 0) < (*comp).logCategories[(((NI) 0))- 0]);
		LA6_: ;
		T3_ = T5_;
		LA4_: ;
		if (!T3_) goto LA7_;
		nimln_(9, "/home/jose/src/fmi.nim/src/prueba/logger.nim");
		result = NIM_TRUE;
		goto BeforeRet_;
	}
	LA7_: ;
	nimln_(10, "/home/jose/src/fmi.nim/src/prueba/logger.nim");
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
static N_NIMCALL(void, Marker_tySequence__sM4lkSb7zS6F7OVMvW9cffQ)(void* p, NI op) {
	tySequence__sM4lkSb7zS6F7OVMvW9cffQ* a;
	NI T1_;
	a = (tySequence__sM4lkSb7zS6F7OVMvW9cffQ*)p;
	T1_ = (NI)0;
	for (T1_ = 0; T1_ < (a ? a->Sup.len : 0); T1_++) {
	nimGCvisit((void*)a->data[T1_], op);
	}
}
static N_INLINE(NI, minuspercent___dgYAo7RfdUVVpvkfKDym8wsystem)(NI x, NI y) {
	NI result;
	nimfr_("-%", "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/arithmeti"
"cs.nim");
	result = (NI)0;
	nimln_(437, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/arithmeti"
"cs.nim");
	nimln_(441, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/arithmeti"
"cs.nim");
	result = ((NI) ((NU)((NU64)(((NU) (x))) - (NU64)(((NU) (y))))));
	popFrame();
	return result;
}
static N_INLINE(NIM_BOOL, ltpercent___hPljn3JCDQ00ua1R07X9bxQsystem)(NI x, NI y) {
	NIM_BOOL result;
	nimfr_("<%", "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/compariso"
"ns.nim");
	result = (NIM_BOOL)0;
	nimln_(188, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/compariso"
"ns.nim");
	nimln_(190, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/compariso"
"ns.nim");
	result = ((NU64)(((NU) (x))) < (NU64)(((NU) (y))));
	popFrame();
	return result;
}
static N_INLINE(void, rtlAddZCT__AT1eRuflKWyTTBdLjEDZbg_3system)(tyObject_Cell__1zcF9cV8XIAtbN8h5HRUB8g* c) {
	nimfr_("rtlAddZCT", "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/gc.nim");
	nimln_(196, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/gc.nim");
	addZCT__Y66tOYFjgwJ0k4aLz4bc0Q((&gch__IcYaEuuWivYAS86vFMTS3Q.zct), c);
	popFrame();
}
static N_INLINE(void, decRef__AT1eRuflKWyTTBdLjEDZbg_2system)(tyObject_Cell__1zcF9cV8XIAtbN8h5HRUB8g* c) {
	nimfr_("decRef", "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/gc.nim");
	nimln_(201, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/gc.nim");
	(*c).refcount = minuspercent___dgYAo7RfdUVVpvkfKDym8wsystem((*c).refcount, ((NI) 8));
	nimln_(202, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/gc.nim");
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = ltpercent___hPljn3JCDQ00ua1R07X9bxQsystem((*c).refcount, ((NI) 8));
		if (!T3_) goto LA4_;
		nimln_(203, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/gc.nim");
		rtlAddZCT__AT1eRuflKWyTTBdLjEDZbg_3system(c);
	}
	LA4_: ;
	popFrame();
}
static N_INLINE(tyObject_Cell__1zcF9cV8XIAtbN8h5HRUB8g*, usrToCell__QFQqcLB3lgOdwipkv9a60xwsystem)(void* usr) {
	tyObject_Cell__1zcF9cV8XIAtbN8h5HRUB8g* result;
	NI T1_;
	nimfr_("usrToCell", "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/gc.nim");
	result = (tyObject_Cell__1zcF9cV8XIAtbN8h5HRUB8g*)0;
	nimln_(130, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/gc.nim");
	T1_ = (NI)0;
	T1_ = minuspercent___dgYAo7RfdUVVpvkfKDym8wsystem(((NI) (ptrdiff_t) (usr)), ((NI) 16));
	result = ((tyObject_Cell__1zcF9cV8XIAtbN8h5HRUB8g*) (T1_));
	popFrame();
	return result;
}
static N_INLINE(void, nimGCunrefNoCycle)(void* p) {
	tyObject_Cell__1zcF9cV8XIAtbN8h5HRUB8g* T1_;
	nimfr_("nimGCunrefNoCycle", "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/gc.nim");
	nimln_(229, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/gc.nim");
	T1_ = (tyObject_Cell__1zcF9cV8XIAtbN8h5HRUB8g*)0;
	T1_ = usrToCell__QFQqcLB3lgOdwipkv9a60xwsystem(p);
	decRef__AT1eRuflKWyTTBdLjEDZbg_2system(T1_);
	popFrame();
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
N_LIB_PRIVATE N_NIMCALL(NCSTRING, logCategoriesNames__fBTDHtIu1eEelQgqP4O36Q)(int idx) {
	NCSTRING result;
	tySequence__sM4lkSb7zS6F7OVMvW9cffQ* categoriesNames;
	NimStringDesc* T1_;
	NimStringDesc* T2_;
	NimStringDesc* T3_;
	NimStringDesc* T4_;
	nimfr_("logCategoriesNames", "/home/jose/src/fmi.nim/src/prueba/logger.nim");
{	result = (NCSTRING)0;
	nimln_(13, "/home/jose/src/fmi.nim/src/prueba/logger.nim");
	categoriesNames = (tySequence__sM4lkSb7zS6F7OVMvW9cffQ*) newSeq((&NTI__sM4lkSb7zS6F7OVMvW9cffQ_), 4);
	T1_ = (NimStringDesc*)0;
	T1_ = categoriesNames->data[0]; categoriesNames->data[0] = copyStringRC1(((NimStringDesc*) &TM__AK9ckCksWPE1OuNZoPFGU5g_2));
	if (T1_) nimGCunrefNoCycle(T1_);
	T2_ = (NimStringDesc*)0;
	T2_ = categoriesNames->data[1]; categoriesNames->data[1] = copyStringRC1(((NimStringDesc*) &TM__AK9ckCksWPE1OuNZoPFGU5g_3));
	if (T2_) nimGCunrefNoCycle(T2_);
	T3_ = (NimStringDesc*)0;
	T3_ = categoriesNames->data[2]; categoriesNames->data[2] = copyStringRC1(((NimStringDesc*) &TM__AK9ckCksWPE1OuNZoPFGU5g_4));
	if (T3_) nimGCunrefNoCycle(T3_);
	T4_ = (NimStringDesc*)0;
	T4_ = categoriesNames->data[3]; categoriesNames->data[3] = copyStringRC1(((NimStringDesc*) &TM__AK9ckCksWPE1OuNZoPFGU5g_5));
	if (T4_) nimGCunrefNoCycle(T4_);
	nimln_(14, "/home/jose/src/fmi.nim/src/prueba/logger.nim");
	if ((NU)(idx) >= (NU)(categoriesNames ? categoriesNames->Sup.len : 0)){ raiseIndexError2(idx,(categoriesNames ? categoriesNames->Sup.len : 0)-1); }
	result = nimToCStringConv(categoriesNames->data[idx]);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_PRIVATE N_NIMCALL(void, filteredLog__lw3suybQ5yRVSDxTrBDwWg)(tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* instance, tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg status, int categoryIndex, NCSTRING message) {
	tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w i;
	union { tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w* source; tyObject_ModelInstance__7UjX9aPnXtrm0op9cdZeQ9a0w dest; } LOC1;
	nimfr_("filteredLog", "/home/jose/src/fmi.nim/src/prueba/logger.nim");
	nimln_(17, "/home/jose/src/fmi.nim/src/prueba/logger.nim");
	LOC1.source = instance;
	i = LOC1.dest;
	nimln_(18, "/home/jose/src/fmi.nim/src/prueba/logger.nim");
	{
		NIM_BOOL T4_;
		NIM_BOOL T5_;
		tyProc__ihdMnMKg5uf38WyS4C7wEw log_1;
		NCSTRING T10_;
		nimln_(19, "/home/jose/src/fmi.nim/src/prueba/logger.nim");
		T4_ = (NIM_BOOL)0;
		nimln_(18, "/home/jose/src/fmi.nim/src/prueba/logger.nim");
		T5_ = (NIM_BOOL)0;
		T5_ = (status == ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 3));
		if (T5_) goto LA6_;
		nimln_(19, "/home/jose/src/fmi.nim/src/prueba/logger.nim");
		T5_ = (status == ((tyEnum_fmi2Status__OVS3o9aYFCNieKrbEe9aZwQg) 4));
		LA6_: ;
		T4_ = T5_;
		if (T4_) goto LA7_;
		nimln_(20, "/home/jose/src/fmi.nim/src/prueba/logger.nim");
		T4_ = isCategoryLogged__9a8x6ZVL34qUFAzcWYHvH2g(instance, categoryIndex);
		LA7_: ;
		if (!T4_) goto LA8_;
		nimZeroMem((void*)(&log_1), sizeof(tyProc__ihdMnMKg5uf38WyS4C7wEw));
		nimln_(21, "/home/jose/src/fmi.nim/src/prueba/logger.nim");
		log_1.ClE_0 = (*i.functions).logger.ClE_0;
		log_1.ClP_0 = (*i.functions).logger.ClP_0;
		nimln_(23, "/home/jose/src/fmi.nim/src/prueba/logger.nim");
		nimln_(24, "/home/jose/src/fmi.nim/src/prueba/logger.nim");
		T10_ = (NCSTRING)0;
		T10_ = logCategoriesNames__fBTDHtIu1eEelQgqP4O36Q(categoryIndex);
		log_1.ClE_0? log_1.ClP_0((*(*instance).functions).componentEnvironment, (*instance).instanceName, status, T10_, message, log_1.ClE_0):((TM__AK9ckCksWPE1OuNZoPFGU5g_6)(log_1.ClP_0))((*(*instance).functions).componentEnvironment, (*instance).instanceName, status, T10_, message);
	}
	LA8_: ;
	popFrame();
}
N_LIB_PRIVATE N_NIMCALL(void, unknown_loggerDatInit000)(void) {

/* section: NIM_merge_TYPE_INIT3 */
NTI__sM4lkSb7zS6F7OVMvW9cffQ_.size = sizeof(tySequence__sM4lkSb7zS6F7OVMvW9cffQ*);
NTI__sM4lkSb7zS6F7OVMvW9cffQ_.align = NIM_ALIGNOF(tySequence__sM4lkSb7zS6F7OVMvW9cffQ*);
NTI__sM4lkSb7zS6F7OVMvW9cffQ_.kind = 24;
NTI__sM4lkSb7zS6F7OVMvW9cffQ_.base = (&NTI__77mFvmsOLKik79ci2hXkHEg_);
NTI__sM4lkSb7zS6F7OVMvW9cffQ_.flags = 2;
NTI__sM4lkSb7zS6F7OVMvW9cffQ_.marker = Marker_tySequence__sM4lkSb7zS6F7OVMvW9cffQ;
}

