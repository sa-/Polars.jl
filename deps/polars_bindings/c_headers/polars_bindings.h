#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

typedef struct Person {
  const char *name;
  int64_t age;
} Person;

void greet(struct Person person);
