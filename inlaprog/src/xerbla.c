#include <string.h>
#if !defined(__FreeBSD__)
#include <malloc.h>
#endif
#include <stdlib.h>
#include <stdio.h>


void xerbla_(char *srname, int *info, int len)
{
	// fortran version
	char *name = (char *) calloc(len+1, sizeof(char));
	memcpy(name, srname, len * sizeof(char));
	name[len] = '\0';
	fprintf(stderr, "\nxerbla: %s %d\n", name, *info);
	exit(1);
}


void xerbla(char *srname, int *info)
{
	fprintf(stderr, "\nxerbla: %s %d\n", srname, *info);
	exit(1);
}
