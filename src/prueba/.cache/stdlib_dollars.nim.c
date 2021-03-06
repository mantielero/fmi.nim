/* Generated by Nim Compiler v1.4.2 */
/*   (c) 2020 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Linux, amd64, gcc */
/* Command for C compiler:
   gcc -c  -w -fmax-errors=3  -fPIC  -I/home/jose/.choosenim/toolchains/nim-1.4.2/lib -I/home/jose/src/fmi.nim/src/prueba -o /home/jose/src/fmi.nim/src/prueba/.cache/stdlib_dollars.nim.c.o /home/jose/src/fmi.nim/src/prueba/.cache/stdlib_dollars.nim.c */
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
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, copyString)(NimStringDesc* src);
N_NIMCALL(NimStringDesc*, mnewString)(NI len);
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, setLengthStr)(NimStringDesc* s, NI newLen);
static N_INLINE(void, nimFrame)(TFrame* s);
N_LIB_PRIVATE N_NOINLINE(void, callDepthLimitReached__mMRdr4sgmnykA9aWeM9aDZlw)(void);
static N_INLINE(void, popFrame)(void);

/* section: NIM_merge_DATA */
STRING_LITERAL(TM__n49a9aYp5BrbXv9a6OCpJYm0g_2, "0", 1);

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
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, dollar___M2d4UEGH9cZOvte6rEhvUTQ)(NU64 x) {
	NimStringDesc* result;
	nimfr_("$", "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/dollars.n"
"im");
	result = (NimStringDesc*)0;
	nimln_(26, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/dollars.n"
"im");
	{
		if (!(x == 0ULL)) goto LA3_;
		nimln_(27, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/dollars.n"
"im");
		result = copyString(((NimStringDesc*) &TM__n49a9aYp5BrbXv9a6OCpJYm0g_2));
	}
	goto LA1_;
	LA3_: ;
	{
		NI i;
		NU64 n;
		NI half;
		nimln_(29, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/dollars.n"
"im");
		result = mnewString(((NI) 60));
		nimln_(30, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/dollars.n"
"im");
		i = ((NI) 0);
		nimln_(31, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/dollars.n"
"im");
		n = x;
		{
			nimln_(32, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/dollars.n"
"im");
			while (1) {
				NU64 nn;
				if (!!((n == 0ULL))) goto LA7;
				nimln_(33, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/dollars.n"
"im");
				nn = (NU64)((NU64)(n) / (NU64)(10ULL));
				nimln_(34, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/dollars.n"
"im");
				result->data[i] = ((NIM_CHAR) ((NU64)((NU64)((NU64)((NU64)(n) - (NU64)((NU64)((NU64)(10ULL) * (NU64)(nn))))) + (NU64)(48ULL))));
				nimln_(35, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/dollars.n"
"im");
				i += ((NI) 1);
				nimln_(36, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/dollars.n"
"im");
				n = nn;
			} LA7: ;
		}
		nimln_(37, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/dollars.n"
"im");
		result = setLengthStr(result, ((NI) (i)));
		nimln_(39, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/dollars.n"
"im");
		half = (NI)(i / ((NI) 2));
		{
			NI t;
			NI colontmp_;
			NI res;
			t = (NI)0;
			colontmp_ = (NI)0;
			nimln_(41, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/dollars.n"
"im");
			colontmp_ = (NI)(half - ((NI) 1));
			nimln_(77, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
			res = ((NI) 0);
			{
				nimln_(78, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
				while (1) {
					NIM_CHAR T11_;
					if (!(res <= colontmp_)) goto LA10;
					nimln_(41, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/dollars.n"
"im");
					t = res;
					T11_ = (NIM_CHAR)0;
					T11_ = result->data[t];
					result->data[t] = result->data[(NI)((NI)(i - t) - ((NI) 1))];
					result->data[(NI)((NI)(i - t) - ((NI) 1))] = T11_;
					nimln_(80, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
"_1.nim");
					res += ((NI) 1);
				} LA10: ;
			}
		}
	}
	LA1_: ;
	popFrame();
	return result;
}
