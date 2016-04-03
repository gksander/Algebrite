###
 Returns the real part of complex z

	z		real(z)
	-		-------

	a + i b		a

	exp(i a)	cos(a)
###

#include "stdafx.h"
#include "defs.h"

Eval_real = ->
	push(cadr(p1));
	Eval();
	real();

real = ->
	save();
	rect();
	p1 = pop();
	push(p1);
	push(p1);
	conjugate();
	add();
	push_integer(2);
	divide();
	restore();

#if SELFTEST

s = [

	"real(a+i*b)",
	"a",

	"real(1+exp(i*pi/3))",
	"3/2",

	"real(i)",
	"0",

	"real((-1)^(1/3))",
	"1/2",
]

###
void
test_real(void)
{
	test(__FILE__, s, sizeof s / sizeof (char *));
}

#endif
###