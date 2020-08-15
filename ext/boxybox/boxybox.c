#include "boxybox.h"

VALUE rb_mBoxybox;

void
Init_boxybox(void)
{
  rb_mBoxybox = rb_define_module("Boxybox");
}
