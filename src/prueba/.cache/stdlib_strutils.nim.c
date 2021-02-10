/* Generated by Nim Compiler v1.4.2 */
/*   (c) 2020 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Linux, amd64, gcc */
/* Command for C compiler:
   gcc -c  -w -fmax-errors=3  -fPIC  -I/home/jose/.choosenim/toolchains/nim-1.4.2/lib -I/home/jose/src/fmi.nim/src/prueba -o /home/jose/src/fmi.nim/src/prueba/.cache/stdlib_strutils.nim.c.o /home/jose/src/fmi.nim/src/prueba/.cache/stdlib_strutils.nim.c */
#define NIM_INTBITS 64

/* section: NIM_merge_HEADERS */

#include "nimbase.h"
#include <stdio.h>
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
typedef NU8 tyEnum_FloatFormatMode__pNvEoaqwoxKyoASD11vSgQ;
typedef NIM_CHAR tyArray__9bPFPkkEEeeNM9bKgiV8Q49cg[6];
typedef NIM_CHAR tyArray__Kn8ZOVsorvcNLB4isUeMzQ[2501];
typedef NIM_CHAR tyArray__vB7L5YKNrMfbzoUubCEcYg[3];

/* section: NIM_merge_PROC_HEADERS */
N_NIMCALL(NimStringDesc*, mnewString)(NI len);
N_LIB_PRIVATE N_NOINLINE(void, raiseOverflow)(void);
N_LIB_PRIVATE N_NOINLINE(void, raiseIndexError2)(NI i, NI n);
static N_INLINE(void, nimFrame)(TFrame* s);
N_LIB_PRIVATE N_NOINLINE(void, callDepthLimitReached__mMRdr4sgmnykA9aWeM9aDZlw)(void);
static N_INLINE(void, popFrame)(void);
N_LIB_PRIVATE N_NOINLINE(void, raiseRangeErrorI)(NI64 i, NI64 a, NI64 b);
N_LIB_PRIVATE N_NIMCALL(NIM_CHAR, nsuToUpperAsciiChar)(NIM_CHAR c);

/* section: NIM_merge_DATA */
N_LIB_PRIVATE NIM_CONST tyArray__vB7L5YKNrMfbzoUubCEcYg floatFormatToChar__WVISPus3ZqCVSuP9bzn9cVxw = {103,
102,
101}
;

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
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, nsuRepeatChar)(NIM_CHAR c, NI count) {
	NimStringDesc* result;
	nimfr_("repeat", "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
	result = (NimStringDesc*)0;
	nimln_(1368, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
	result = mnewString(count);
	{
		NI i;
		NI colontmp_;
		NI TM__JGc9b9bh2D3nTdUR7TGyq8aA_2;
		NI res;
		i = (NI)0;
		colontmp_ = (NI)0;
		nimln_(1369, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
		if (nimSubInt(((NI) (count)), ((NI) 1), &TM__JGc9b9bh2D3nTdUR7TGyq8aA_2)) { raiseOverflow(); };
		colontmp_ = (NI)(TM__JGc9b9bh2D3nTdUR7TGyq8aA_2);
		nimln_(77, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
		res = ((NI) 0);
		{
			nimln_(78, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
			while (1) {
				NI TM__JGc9b9bh2D3nTdUR7TGyq8aA_3;
				if (!(res <= colontmp_)) goto LA3;
				nimln_(1369, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
				i = res;
				if ((NU)(i) >= (NU)(result ? result->Sup.len : 0)){ raiseIndexError2(i,(result ? result->Sup.len : 0)-1); }
				result->data[i] = c;
				nimln_(80, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
				if (nimAddInt(res, ((NI) 1), &TM__JGc9b9bh2D3nTdUR7TGyq8aA_3)) { raiseOverflow(); };
				res = (NI)(TM__JGc9b9bh2D3nTdUR7TGyq8aA_3);
			} LA3: ;
		}
	}
	popFrame();
	return result;
}
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, nsuformatBiggestFloat)(NF f, tyEnum_FloatFormatMode__pNvEoaqwoxKyoASD11vSgQ format, NI precision, NIM_CHAR decimalSep) {
	NimStringDesc* result;
	tyArray__9bPFPkkEEeeNM9bKgiV8Q49cg frmtstr;
	tyArray__Kn8ZOVsorvcNLB4isUeMzQ buf;
	int L;
	nimfr_("formatBiggestFloat", "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
	result = (NimStringDesc*)0;
	L = (int)0;
	nimln_(2462, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
	frmtstr[(((NI) 0))- 0] = 37;
	nimln_(2463, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
	{
		if (!(((NI) 0) <= ((NI) (precision)))) goto LA3_;
		nimln_(2464, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
		frmtstr[(((NI) 1))- 0] = 35;
		nimln_(2465, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
		frmtstr[(((NI) 2))- 0] = 46;
		nimln_(2466, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
		frmtstr[(((NI) 3))- 0] = 42;
		nimln_(2467, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
		frmtstr[(((NI) 4))- 0] = floatFormatToChar__WVISPus3ZqCVSuP9bzn9cVxw[(format)- 0];
		nimln_(2468, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
		frmtstr[(((NI) 5))- 0] = 0;
		nimln_(2470, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
		L = sprintf(((NCSTRING) (buf)), ((NCSTRING) (frmtstr)), precision, f);
	}
	goto LA1_;
	LA3_: ;
	{
		nimln_(2474, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
		frmtstr[(((NI) 1))- 0] = floatFormatToChar__WVISPus3ZqCVSuP9bzn9cVxw[(format)- 0];
		nimln_(2475, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
		frmtstr[(((NI) 2))- 0] = 0;
		nimln_(2477, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
		L = sprintf(((NCSTRING) (buf)), ((NCSTRING) (frmtstr)), f);
	}
	LA1_: ;
	nimln_(2480, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
	if ((L) < ((NI) 0) || (L) > ((NI) IL64(9223372036854775807))){ raiseRangeErrorI(L, ((NI) 0), ((NI) IL64(9223372036854775807))); }
	result = mnewString(((NI) (L)));
	{
		NI32 i;
		NI32 res;
		i = (NI32)0;
		nimln_(115, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
		res = ((NI32) 0);
		{
			nimln_(116, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
			while (1) {
				NI TM__JGc9b9bh2D3nTdUR7TGyq8aA_4;
				if (!(res < L)) goto LA8;
				nimln_(2481, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
				i = res;
				nimln_(2484, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
				{
					if ((NU)(i) > (NU)(2500)){ raiseIndexError2(i, 2500); }
					if (!(((NU8)(buf[(i)- 0])) == ((NU8)(46)) || ((NU8)(buf[(i)- 0])) == ((NU8)(44)))) goto LA11_;
					if ((NU)(i) >= (NU)(result ? result->Sup.len : 0)){ raiseIndexError2(i,(result ? result->Sup.len : 0)-1); }
					result->data[i] = decimalSep;
				}
				goto LA9_;
				LA11_: ;
				{
					if ((NU)(i) >= (NU)(result ? result->Sup.len : 0)){ raiseIndexError2(i,(result ? result->Sup.len : 0)-1); }
					nimln_(2485, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
					if ((NU)(i) > (NU)(2500)){ raiseIndexError2(i, 2500); }
					result->data[i] = buf[(i)- 0];
				}
				LA9_: ;
				nimln_(118, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
				if (nimAddInt(res, ((NI) 1), &TM__JGc9b9bh2D3nTdUR7TGyq8aA_4)) { raiseOverflow(); };
				if (TM__JGc9b9bh2D3nTdUR7TGyq8aA_4 < (-2147483647 -1) || TM__JGc9b9bh2D3nTdUR7TGyq8aA_4 > 2147483647){ raiseOverflow(); }
				res = (NI32)(TM__JGc9b9bh2D3nTdUR7TGyq8aA_4);
			} LA8: ;
		}
	}
	popFrame();
	return result;
}
N_LIB_PRIVATE N_NIMCALL(NIM_CHAR, nsuToUpperAsciiChar)(NIM_CHAR c) {
	NIM_CHAR result;
	nimfr_("toUpperAscii", "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
	result = (NIM_CHAR)0;
	nimln_(250, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
	{
		NI TM__JGc9b9bh2D3nTdUR7TGyq8aA_6;
		if (!(((NU8)(c)) >= ((NU8)(97)) && ((NU8)(c)) <= ((NU8)(122)))) goto LA3_;
		nimln_(251, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
		if (nimSubInt(((NU8)(c)), ((NI) 32), &TM__JGc9b9bh2D3nTdUR7TGyq8aA_6)) { raiseOverflow(); };
		if (((NI)(TM__JGc9b9bh2D3nTdUR7TGyq8aA_6)) < ((NI) 0) || ((NI)(TM__JGc9b9bh2D3nTdUR7TGyq8aA_6)) > ((NI) 255)){ raiseRangeErrorI((NI)(TM__JGc9b9bh2D3nTdUR7TGyq8aA_6), ((NI) 0), ((NI) 255)); }
		result = ((NIM_CHAR) (((NI) ((NI)(TM__JGc9b9bh2D3nTdUR7TGyq8aA_6)))));
	}
	goto LA1_;
	LA3_: ;
	{
		nimln_(253, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
		result = c;
	}
	LA1_: ;
	popFrame();
	return result;
}
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, nsuToUpperAsciiStr)(NimStringDesc* s) {
	NimStringDesc* result;
	nimfr_("toUpperAscii", "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
	result = (NimStringDesc*)0;
	nimln_(217, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
	if (((s ? s->Sup.len : 0)) < ((NI) 0) || ((s ? s->Sup.len : 0)) > ((NI) IL64(9223372036854775807))){ raiseRangeErrorI((s ? s->Sup.len : 0), ((NI) 0), ((NI) IL64(9223372036854775807))); }
	result = mnewString(((NI) ((s ? s->Sup.len : 0))));
	{
		NI iX60gensym11_;
		NI colontmp_;
		NI TM__JGc9b9bh2D3nTdUR7TGyq8aA_5;
		NI res;
		iX60gensym11_ = (NI)0;
		colontmp_ = (NI)0;
		nimln_(218, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
		if (nimSubInt((s ? s->Sup.len : 0), ((NI) 1), &TM__JGc9b9bh2D3nTdUR7TGyq8aA_5)) { raiseOverflow(); };
		colontmp_ = (NI)(TM__JGc9b9bh2D3nTdUR7TGyq8aA_5);
		nimln_(77, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
		res = ((NI) 0);
		{
			nimln_(78, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
			while (1) {
				NI TM__JGc9b9bh2D3nTdUR7TGyq8aA_7;
				if (!(res <= colontmp_)) goto LA3;
				nimln_(267, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
				iX60gensym11_ = res;
				if ((NU)(iX60gensym11_) >= (NU)(result ? result->Sup.len : 0)){ raiseIndexError2(iX60gensym11_,(result ? result->Sup.len : 0)-1); }
				nimln_(219, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/pure/strutils.ni"
"m");
				if ((NU)(iX60gensym11_) >= (NU)(s ? s->Sup.len : 0)){ raiseIndexError2(iX60gensym11_,(s ? s->Sup.len : 0)-1); }
				result->data[iX60gensym11_] = nsuToUpperAsciiChar(s->data[iX60gensym11_]);
				nimln_(80, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
				if (nimAddInt(res, ((NI) 1), &TM__JGc9b9bh2D3nTdUR7TGyq8aA_7)) { raiseOverflow(); };
				res = (NI)(TM__JGc9b9bh2D3nTdUR7TGyq8aA_7);
			} LA3: ;
		}
	}
	popFrame();
	return result;
}
