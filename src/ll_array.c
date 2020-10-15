#include <stdlib.h>
#include <string.h>

#include "error_handle.h"
#include "ll_array.h"

struct ll_array_t copy_ll_array(const struct ll_array_t* const ll_array_to_copy) {
    struct ll_array_t new_ll_array = {ll_array_to_copy->len, (long long*) malloc(ll_array_to_copy->len * sizeof(long long))};
    if (new_ll_array.elems == NULL) {
        free(ll_array_to_copy->elems);
        error_handle("Memory allocation for ll_array's copy failed");
    }
    memcpy(new_ll_array.elems, ll_array_to_copy->elems, new_ll_array.len * sizeof(long long));
    return new_ll_array;
}

unsigned int find_ll_arrays_diff(const struct ll_array_t* const array1, const struct ll_array_t* const array2) {
    size_t min_array_len;
    if (array1->len <= array2->len) {
        min_array_len = array1->len;
    } else {
        min_array_len = array2->len;
    }
    unsigned int diff_nums_count = 0;
    for (unsigned int i = 0; i < min_array_len; i++) {
        if (array1->elems[i] != array2->elems[i]) {
            diff_nums_count++;
        }
    }
    return diff_nums_count;
}
