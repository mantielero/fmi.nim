/* Generated by Nim Compiler v1.4.2 */
/*   (c) 2020 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Linux, amd64, gcc */
/* Command for C compiler:
   gcc -c  -w -fmax-errors=3  -fPIC  -I/home/jose/.choosenim/toolchains/nim-1.4.2/lib -I/home/jose/src/fmi.nim/src/prueba -o /home/jose/src/fmi.nim/src/prueba/.cache/stdlib_io.nim.c.o /home/jose/src/fmi.nim/src/prueba/.cache/stdlib_io.nim.c */
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

/* section: NIM_merge_PROC_HEADERS */
N_LIB_PRIVATE N_NOINLINE(void, raiseIndexError2)(NI i, NI n);
static N_INLINE(NCSTRING, nimToCStringConv)(NimStringDesc* s);
N_LIB_PRIVATE N_NOINLINE(void, raiseOverflow)(void);
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
N_LIB_PRIVATE N_NIMCALL(void, echoBinSafe)(NimStringDesc** args, NI argsLen_0) {
	int T5_;
	int T6_;
	nimfr_("echoBinSafe", "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/io.nim");
	nimln_(787, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/io.nim");
	flockfile(stdout);
	{
		NimStringDesc** s;
		NI i;
		s = (NimStringDesc**)0;
		nimln_(8, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
".nim");
		i = ((NI) 0);
		{
			nimln_(9, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
".nim");
			while (1) {
				int T4_;
				NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_2;
				if (!(i < argsLen_0)) goto LA3;
				nimln_(790, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/io.nim");
				if ((NU)(i) >= (NU)(argsLen_0)){ raiseIndexError2(i,argsLen_0-1); }
				s = (&args[i]);
				nimln_(794, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/io.nim");
				T4_ = (int)0;
				T4_ = fwrite(((void*) (nimToCStringConv((*s)))), ((size_t) (((*s) ? (*s)->Sup.len : 0))), ((size_t) 1), stdout);
				(void)(T4_);
				nimln_(11, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/iterators"
".nim");
				if (nimAddInt(i, ((NI) 1), &TM__MnCJ0VAmeZ9aTATUB39cx60Q_2)) { raiseOverflow(); };
				i = (NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_2);
			} LA3: ;
		}
	}
	nimln_(796, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/io.nim");
	T5_ = (int)0;
	T5_ = fwrite(((void*) ("\012")), ((size_t) 1), ((size_t) 1), stdout);
	(void)(T5_);
	nimln_(797, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/io.nim");
	T6_ = (int)0;
	T6_ = fflush(stdout);
	(void)(T6_);
	nimln_(799, "/home/jose/.choosenim/toolchains/nim-1.4.2/lib/system/io.nim");
	funlockfile(stdout);
	popFrame();
}
