#ifndef LL_ARRAY_H
#define LL_ARRAY_H

#include <stdlib.h>

struct ll_array_t {
    size_t len;
    long long* elems;
};

struct ll_array_t copy_ll_array(const struct ll_array_t* ll_array_to_copy);

unsigned int find_ll_arrays_diff(const struct ll_array_t* array1, const struct ll_array_t* array2);

#endif
