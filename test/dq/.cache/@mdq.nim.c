/* Generated by Nim Compiler v1.4.2 */
/*   (c) 2020 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Linux, amd64, gcc */
/* Command for C compiler:
   gcc -c  -w -fmax-errors=3 -DDISABLE_PREFIX -DFMI2_FUNCTION_PREFIX=MyModel_ -I/home/jose/src/nimlang/fmusdk-master/fmu20/src/shared/include -fvisibility=hidden -I/home/jose/src/nimlang/fmusdk-master/fmu20/src/shared/include -w -fmax-errors=5 -DMODEL_IDENTIFIER=\"dq\" -DMODEL_GUID=\"{8c4e810f-3df3-4a00-8276-176fa3c9f000}\" -DNUMBER_OF_REALS=3 -DNUMBER_OF_INTEGERS=0 -DNUMBER_OF_BOOLEANS=0 -DNUMBER_OF_STRINGS=0 -DNUMBER_OF_STATES=1 -DNUMBER_OF_EVENT_INDICATORS=0  -fPIC  -I/home/jose/.choosenim/toolchains/nim-1.4.2/lib -I/home/jose/src/fmi.nim/test/dq -o /home/jose/src/fmi.nim/test/dq/.cache/@mdq.nim.c.o /home/jose/src/fmi.nim/test/dq/.cache/@mdq.nim.c */
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
#define nimfr_(x, y)
#define nimln_(x, y)

/* section: NIM_merge_PROC_HEADERS */
static N_INLINE(void, initStackBottomWith)(void* locals);
N_LIB_PRIVATE N_NOINLINE(void, nimGC_setStackBottom)(void* theStackBottom);
N_LIB_PRIVATE N_NIMCALL(void, systemDatInit000)(void);
N_LIB_PRIVATE N_NIMCALL(void, systemInit000)(void);
N_LIB_PRIVATE N_NIMCALL(void, NimMainModule)(void);

/* section: NIM_merge_PROCS */
static N_INLINE(void, initStackBottomWith)(void* locals) {
	nimGC_setStackBottom(locals);
}

N_LIB_PRIVATE void PreMainInner(void) {
}

N_LIB_PRIVATE int cmdCount;
N_LIB_PRIVATE char** cmdLine;
N_LIB_PRIVATE char** gEnv;
N_LIB_PRIVATE void PreMain(void) {
	void (*volatile inner)(void);
	inner = PreMainInner;
	systemDatInit000();
	initStackBottomWith((void *)&inner);
	systemInit000();
	(*inner)();
}

N_LIB_PRIVATE N_CDECL(void, NimMainInner)(void) {
	NimMainModule();
}

N_LIB_EXPORT N_CDECL(void, NimMain)(void) {
	void (*volatile inner)(void);
	PreMain();
	inner = NimMainInner;
	initStackBottomWith((void *)&inner);
	(*inner)();
}

N_LIB_PRIVATE void NIM_POSIX_INIT NimMainInit(void) {
	NimMain();
}

N_LIB_PRIVATE N_NIMCALL(void, NimMainModule)(void) {
{
}
}

