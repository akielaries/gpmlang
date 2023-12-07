#include "libio.h"
#include <stdio.h>
#include <stdarg.h>

// print any type to stdout
void print(const char* format, ...) {
    va_list args;
    va_start(args, format);
    vprintf(format, args);
    va_end(args);
}



