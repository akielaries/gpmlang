#include "libio.h"
#include <stdarg.h>
#include <stdio.h>

// print any type to stdout
void print(const char *format, ...) {
    va_list args;
    va_start(args, format);
    vprintf(format, args);
    va_end(args);
}
