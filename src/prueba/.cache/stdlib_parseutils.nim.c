/* Generated by Nim Compiler v1.4.2 */
/*   (c) 2020 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Linux, amd64, gcc */
/* Command for C compiler:
   gcc -c  -w -fmax-errors=3  -fPIC  -I/home/jose/.choosenim/toolchains/nim-1.4.2/lib -I/home/jose/src/fmi.nim/src/prueba -o /home/jose/src/fmi.nim/src/prueba/.cache/stdlib_parseutils.nim.c.o /home/jose/src/fmi.nim/src/prueba/.cache/stdlib_parseutils.nim.c */
#define NIM_INTBITS 64

/* section: NIM_merge_HEADERS */

#include "nimbase.h"
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

/* section: NIM_merge_TYPES */
struct TGenericSeq {
NI len;
NI reserved;
};
struct NimStringDesc {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};

/* section: NIM_merge_PROC_HEADERS */
N_LIB_PRIVATE N_NOINLINE(void, raiseIndexError2)(NI i, NI n);
N_LIB_PRIVATE N_NOINLINE(void, raiseOverflow)(void);
N_LIB_PRIVATE N_NOINLINE(void, raiseDivByZero)(void);
static N_INLINE(NIM_BOOL, nimDivInt)(NI a, NI b, NI* res);
static N_INLINE(void, nimFrame)(TFrame* s);
N_LIB_PRIVATE N_NOINLINE(void, callDepthLimitReached__mMRdr4sgmnykA9aWeM9aDZlw)(void);
static N_INLINE(void, popFrame)(void);

/* section: NIM_merge_VARS */
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;

/* section: NIM_merge_PROCS */
static N_INLINE(NIM_BOOL, nimDivInt)(NI a, NI b, NI* res) {
	NIM_BOOL result;
	result = (NIM_BOOL)0;
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = (a == ((NI) (IL64(-9223372036854775807) - IL64(1))));
		if (!(T3_)) goto LA4_;
		T3_ = (b == ((NI) -1));
		LA4_: ;
		if (!T3_) goto LA5_;
		result = NIM_TRUE;
	}
	goto LA1_;
	LA5_: ;
	{
		(*res) = (NI)(a / b);
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
N_LIB_PRIVATE N_NIMCALL(NI, parseSaturatedNatural__hGWFPKYRsDcYFCjZLM9acZw)(NimStringDesc* s, NI* b, NI start) {
	NI result;
	NI i;
	nimfr_("parseSaturatedNatural", "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/parseutils."
"nim");
	result = (NI)0;
	nimln_(490, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/parseutils."
"nim");
	i = start;
	nimln_(491, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/parseutils."
"nim");
	{
		NIM_BOOL T3_;
		NI TM__vI9aZNKIcImom6dDyKXW1ZA_2;
		T3_ = (NIM_BOOL)0;
		T3_ = (i < (s ? s->Sup.len : 0));
		if (!(T3_)) goto LA4_;
		if ((NU)(i) >= (NU)(s ? s->Sup.len : 0)){ raiseIndexError2(i,(s ? s->Sup.len : 0)-1); }
		T3_ = ((NU8)(s->data[i]) == (NU8)(43));
		LA4_: ;
		if (!T3_) goto LA5_;
		if (nimAddInt(i, ((NI) 1), &TM__vI9aZNKIcImom6dDyKXW1ZA_2)) { raiseOverflow(); };
		i = (NI)(TM__vI9aZNKIcImom6dDyKXW1ZA_2);
	}
	LA5_: ;
	nimln_(492, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/parseutils."
"nim");
	{
		NIM_BOOL T9_;
		NI TM__vI9aZNKIcImom6dDyKXW1ZA_10;
		T9_ = (NIM_BOOL)0;
		T9_ = (i < (s ? s->Sup.len : 0));
		if (!(T9_)) goto LA10_;
		if ((NU)(i) >= (NU)(s ? s->Sup.len : 0)){ raiseIndexError2(i,(s ? s->Sup.len : 0)-1); }
		T9_ = (((NU8)(s->data[i])) >= ((NU8)(48)) && ((NU8)(s->data[i])) <= ((NU8)(57)));
		LA10_: ;
		if (!T9_) goto LA11_;
		nimln_(493, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/parseutils."
"nim");
		(*b) = ((NI) 0);
		{
			nimln_(494, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/parseutils."
"nim");
			while (1) {
				NIM_BOOL T15_;
				NI c;
				NI TM__vI9aZNKIcImom6dDyKXW1ZA_3;
				NI TM__vI9aZNKIcImom6dDyKXW1ZA_8;
				T15_ = (NIM_BOOL)0;
				T15_ = (i < (s ? s->Sup.len : 0));
				if (!(T15_)) goto LA16_;
				if ((NU)(i) >= (NU)(s ? s->Sup.len : 0)){ raiseIndexError2(i,(s ? s->Sup.len : 0)-1); }
				T15_ = (((NU8)(s->data[i])) >= ((NU8)(48)) && ((NU8)(s->data[i])) <= ((NU8)(57)));
				LA16_: ;
				if (!T15_) goto LA14;
				nimln_(495, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/parseutils."
"nim");
				if ((NU)(i) >= (NU)(s ? s->Sup.len : 0)){ raiseIndexError2(i,(s ? s->Sup.len : 0)-1); }
				if (nimSubInt(((NU8)(s->data[i])), ((NI) 48), &TM__vI9aZNKIcImom6dDyKXW1ZA_3)) { raiseOverflow(); };
				c = (NI)(TM__vI9aZNKIcImom6dDyKXW1ZA_3);
				nimln_(496, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/parseutils."
"nim");
				{
					NI TM__vI9aZNKIcImom6dDyKXW1ZA_4;
					NI TM__vI9aZNKIcImom6dDyKXW1ZA_5;
					NI TM__vI9aZNKIcImom6dDyKXW1ZA_6;
					NI TM__vI9aZNKIcImom6dDyKXW1ZA_7;
					if (nimSubInt(((NI) IL64(9223372036854775807)), c, &TM__vI9aZNKIcImom6dDyKXW1ZA_4)) { raiseOverflow(); };
					if (((NI) 10) == 0){ raiseDivByZero(); }
					if (nimDivInt((NI)(TM__vI9aZNKIcImom6dDyKXW1ZA_4), ((NI) 10), &TM__vI9aZNKIcImom6dDyKXW1ZA_5)) { raiseOverflow(); };
					if (!((*b) <= (NI)(TM__vI9aZNKIcImom6dDyKXW1ZA_5))) goto LA19_;
					nimln_(497, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/parseutils."
"nim");
					if (nimMulInt((*b), ((NI) 10), &TM__vI9aZNKIcImom6dDyKXW1ZA_6)) { raiseOverflow(); };
					if (nimAddInt((NI)(TM__vI9aZNKIcImom6dDyKXW1ZA_6), c, &TM__vI9aZNKIcImom6dDyKXW1ZA_7)) { raiseOverflow(); };
					(*b) = (NI)(TM__vI9aZNKIcImom6dDyKXW1ZA_7);
				}
				goto LA17_;
				LA19_: ;
				{
					nimln_(499, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/parseutils."
"nim");
					(*b) = ((NI) IL64(9223372036854775807));
				}
				LA17_: ;
				nimln_(500, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/parseutils."
"nim");
				if (nimAddInt(i, ((NI) 1), &TM__vI9aZNKIcImom6dDyKXW1ZA_8)) { raiseOverflow(); };
				i = (NI)(TM__vI9aZNKIcImom6dDyKXW1ZA_8);
				{
					nimln_(501, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/parseutils."
"nim");
					while (1) {
						NIM_BOOL T24_;
						NI TM__vI9aZNKIcImom6dDyKXW1ZA_9;
						T24_ = (NIM_BOOL)0;
						T24_ = (i < (s ? s->Sup.len : 0));
						if (!(T24_)) goto LA25_;
						if ((NU)(i) >= (NU)(s ? s->Sup.len : 0)){ raiseIndexError2(i,(s ? s->Sup.len : 0)-1); }
						T24_ = ((NU8)(s->data[i]) == (NU8)(95));
						LA25_: ;
						if (!T24_) goto LA23;
						if (nimAddInt(i, ((NI) 1), &TM__vI9aZNKIcImom6dDyKXW1ZA_9)) { raiseOverflow(); };
						i = (NI)(TM__vI9aZNKIcImom6dDyKXW1ZA_9);
					} LA23: ;
				}
			} LA14: ;
		}
		nimln_(502, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/parseutils."
"nim");
		if (nimSubInt(i, start, &TM__vI9aZNKIcImom6dDyKXW1ZA_10)) { raiseOverflow(); };
		result = (NI)(TM__vI9aZNKIcImom6dDyKXW1ZA_10);
	}
	LA11_: ;
	popFrame();
	return result;
}
