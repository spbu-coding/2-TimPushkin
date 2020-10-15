#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "error_handle.h"
#include "ll_array.h"

#define MAX_INPUT_INTS_NUM 100
#define FRST_PARAM_LEN 7
#define SCND_PARAM_LEN 5

struct main_params_t {
    unsigned int from_count;
    unsigned int to_count;
    long long from;
    long long to;
};

void bubble_sort(struct ll_array_t*);

int parse_main_params(struct main_params_t* const main_params_container, const int* const argc, const char* const* const argv) {
    if (*argc < 2) {
        return -1;
    }
    if (*argc > 3) {
        return -2;
    }
    for (unsigned int i = 1; i < (unsigned int) *argc; i++) {
        if (strncmp(argv[i], "--from=", FRST_PARAM_LEN) == 0) {
            main_params_container->from_count++;
            main_params_container->from = strtoll(argv[i] + FRST_PARAM_LEN, NULL, 10);
        } else if (strncmp(argv[i], "--to=", SCND_PARAM_LEN) == 0) {
            main_params_container->to_count++;
            main_params_container->to = strtoll(argv[i] + SCND_PARAM_LEN, NULL, 10);
        }
    }
    if (main_params_container->from_count > 1 || main_params_container->to_count > 1) {
        return -3;
    }
    if (main_params_container->from_count < 1 && main_params_container->to_count < 1) {
        return -4;
    }
    return 0;
}

struct ll_array_t parse_num_str(const struct main_params_t* const main_params) {
    struct ll_array_t array_to_fill = {0, (long long*) malloc(MAX_INPUT_INTS_NUM * sizeof(long long))};
    if (array_to_fill.elems == NULL) {
        error_handle("Allocating memory for num array failed");
    }
    char space_checker = ' ';
    long long cur_num;
    while (space_checker != '\n') {
        if (scanf("%lli%c", &cur_num, &space_checker) != 2) {
            free(array_to_fill.elems);
            error_handle("Reading nums from stdin failed");
        }
        if (main_params->from_count > 0 && cur_num <= main_params->from) {
            if (printf("%lli ", cur_num) < 0) {
                free(array_to_fill.elems);
                error_handle("Printing nums to stdout failed");
            }
        }
        if (main_params->to_count > 0 && cur_num >= main_params->to) {
            if (fprintf(stderr, "%lli ", cur_num) < 0) {
                free(array_to_fill.elems);
                error_handle("Printing nums to stderr failed");
            }
        }
        if ((main_params->from_count == 0 || cur_num > main_params->from) && (main_params->to_count == 0 || cur_num < main_params->to)) {
            array_to_fill.elems[array_to_fill.len++] = cur_num;
        }
    }
    if (array_to_fill.len == 0) {
        free(array_to_fill.elems);
        array_to_fill.elems = NULL;
    } else if (array_to_fill.len < MAX_INPUT_INTS_NUM) {
        long long* const buff_ptr = (long long*) realloc(array_to_fill.elems, array_to_fill.len * sizeof(long long));
        if (buff_ptr == NULL) {
            free(array_to_fill.elems);
            error_handle("Reallocating memory for num array failed");
        }
        array_to_fill.elems = buff_ptr;
    }
    return array_to_fill;
}

int main(const int argc, const char* const* const argv) {
    struct main_params_t main_params = {0, 0, 0, 0};
    int return_code = parse_main_params(&main_params, &argc, argv);
    if (return_code != 0) {
        return return_code;
    }
    struct ll_array_t unsorted_ll_array = parse_num_str(&main_params);
    struct ll_array_t sorted_ll_array = copy_ll_array(&unsorted_ll_array);
    bubble_sort(&sorted_ll_array);
    return_code = (int) find_ll_arrays_diff(&unsorted_ll_array, &sorted_ll_array);
    free(unsorted_ll_array.elems);
    free(sorted_ll_array.elems);
    return return_code;
}
