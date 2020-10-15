#include "interpreter.h"

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "uthash.h"

struct Idtf *ids = NULL;

int *arrCreate(int n)
{
    int *tmp = (int *)calloc(2, sizeof(int));
    if(NULL == tmp) {
        printError(NULL, "arrCreate, calloc");
    }
    tmp[0] = 1;
    tmp[1] = n;
    return tmp;
}

int *arrMulti(int *oldArr, int n)
{
    if(NULL == oldArr) {
        printError(NULL, "arrMulti, NULL");
    }
    int *tmp = (int *)calloc(oldArr[0]+2, sizeof(int));
    if(NULL == tmp) {
        printError(oldArr, "arrMulti, calloc");
    }
    for(int i = 0; i < oldArr[0]+1; i++) {
        tmp[i] = oldArr[i];
    }
    tmp[0]++;
    tmp[tmp[0]] = n;
    free(oldArr);
    return tmp;
}

void printFree(int *arr)
{
    printList(arr);
    freeList(arr);
}

void printList(int *arr)
{
    printf("Array: ");
    if(NULL != arr) {
        for(int i = 1; i <= arr[0]; i++) {
            printf("%d, ", arr[i]);
        }
    }
    else {
        printf("NIL");
    }
    printf("\n");
}

void freeList(int *arr)
{
    if(NULL != arr) {
        free(arr);
    }
}

int *concatList(int *arr1, int *arr2)
{
    if(NULL == arr1){
        return arr2;
    }
    else if(NULL == arr2) {
        return arr1;
    }
    int len = arr1[0] + arr2[0];
    int *tmp = (int *)calloc(len+1, sizeof(int));
    if(NULL == tmp) {
        free(arr1);
        printError(arr2, "concatList, calloc");
    }
    tmp[0] = len;
    for(int i = 1; i <= arr1[0]; i++) {
        tmp[i] = arr1[i];
    }
    for(int i = 1; i <= arr2[0]; i++) {
        tmp[i+arr1[0]] = arr2[i];
    }
    free(arr1);
    free(arr2);
    return tmp;
}

int *appendList(int *n, int *arr)
{
    if(NULL == arr) {
        return NULL;
    }
    int *tmp = (int *)calloc(arr[0]+1, sizeof(int));
    if(NULL == tmp) {
        printError(n, "appendList, calloc");
    }
    if(1 != n[0]) {
        printError(n, "appendList, not 1-length");
    }
    tmp[0] = arr[0] + 1;
    tmp[1] = n[1];
    for(int i = 1; i <= arr[0]; i++) {
        tmp[i+1] = arr[i];
    }
    free(n);
    free(arr);
    return tmp;
}

int setId(char *name, int *arr)
{
    struct Idtf *tmp = NULL;
    if(NULL == arr) {
        printError(arr, "setId, NULL");
    }
    if(1 != arr[0]) {
        printError(arr, "setId, not 1-length");
    }
    HASH_FIND_STR(ids, name, tmp);
    if(NULL == tmp) {
        tmp = (struct Idtf *)malloc(sizeof(struct Idtf));
        if(NULL == tmp) {
            printError(arr, "setId, malloc");
        }
        strncpy(tmp->name, name, 128);
        HASH_ADD_STR(ids, name, tmp);
    }
    tmp->val = arr[1];
    free(arr);
    return tmp->val;
}

int getId(char *name)
{
    struct Idtf *tmp = NULL;
    HASH_FIND_STR(ids, name, tmp);
    if(NULL == tmp) {
        printf("\nIdentifier '%s' has not been declared.\n", name);
        freeHashTable();
        exit(-1);
    }
    return tmp->val;
}

void freeHashTable(void)
{
    struct Idtf *tmp, *s;
    HASH_ITER(hh, ids, s, tmp) {
        HASH_DEL(ids, s);
        free(s);
    }
}

int strCheck(char *str)
{
    if(3 > strlen(str)) {
        return 0;
    }
    for(int i = 1; i < strlen(str)-1; i++) {
        if('0' <= str[i] && str[i] <= '9') {
            continue;
        }
        else if('a' <= str[i] && str[i] <= 'z') {
            continue;
        }
        else if('A' <= str[i] && str[i] <= 'Z') {
            continue;
        }
        return 0;
    }
    return 1;
}

void printError(int *arr, const char *msg)
{
    printf("Error: %s\n", msg);
    if(NULL != arr) {
        free(arr);
    }
    freeHashTable();
    exit(-1);
}

int addArr(int *arr)
{
    if(NULL == arr) {
        printError(arr, "addArr, NULL");
    }
    int len = arr[0];
    if(2 > len) {
        printError(arr, "addArr, not min 2-length");
    }
    int res = 0;
    for(int i = 1; i <= len; i++) {
        res += arr[i];
    }
    free(arr);
    return res;
}

int subArr(int *arr)
{
    if(NULL == arr) {
        printError(arr, "subArr, NULL");
    }
    int len = arr[0];
    if(2 >  len) {
        printError(arr, "subArr, not min 2-length");
    }
    int res = arr[1];
    for(int i = 2; i <= len; i++) {
        res -= arr[i];
    }
    free(arr);
    return res;
}

int mulArr(int *arr)
{
    if(NULL == arr) {
        printError(arr, "mulArr, NULL");
    }
    int len = arr[0];
    if(2 > len) {
        printError(arr, "mulArr, not min 2-length");
    }
    int res = arr[1];
    for(int i = 2; i <= len; i++) {
        res *= arr[i];
    }
    free(arr);
    return res;
}

int divArr(int *arr)
{
    if(NULL == arr) {
        printError(arr, "divArr, NULL");
    }
    int len = arr[0];
    if(2 != len) {
        printError(arr, "divArr, not 2-length");
    }
    int res = arr[1] / arr[2];
    free(arr);
    return res;
}

int dbmArr(int *arr)
{
    if(NULL == arr) {
        printError(arr, "dbmArr, NULL");
    }
    int len = arr[0];
    if(2 != len) {
        printError(arr, "dbmArr, not 2-length");
    }
    int res = pow(arr[1], arr[2]);
    free(arr);
    return res;
}

int ifArr(int cond, int *arr)
{
    if(NULL == arr) {
        printError(arr, "ifArr, NULL");
    }
    int len = arr[0];
    int res;
    if(0 == len) {
        printError(arr, "ifArr, 0-length");
    }
    else if(1 == len) {
        res = cond ? arr[1] : 0;
    }
    else{
        res = cond ? arr[1] : arr[2];
    }
    free(arr);
    return res;
}

int dspArr(int *arr)
{
    if(NULL == arr) {
        printError(arr, "dspArr, NULL");
    }
    int len = arr[0];
    if(1 != len) {
        printError(arr, "dspArr, not 1-length");
    }
    printf("%d", arr[1]);
    int res = arr[1];
    free(arr);
    return res;
}

int equArr(int *arr)
{
    if(NULL == arr) {
        printError(arr, "equArr, NULL");
    }
    int len = arr[0];
    if(2 != len) {
        printError(arr, "equArr, not 2-length");
    }
    int res = (arr[1] == arr[2]);
    free(arr);
    return res;
}

int lssArr(int *arr)
{
    if(NULL == arr) {
        printError(arr, "lssArr, NULL");
    }
    int len = arr[0];
    if(2 != len) {
        printError(arr, "lssArr, not 2-length");
    }
    int res = (arr[1] < arr[2]);
    free(arr);
    return res;
}

int getVal(int *arr)
{
    if(NULL == arr) {
        printError(arr, "getVal, NULL");
    }
    int len = arr[0];
    if(1 != len) {
        printError(arr, "getVal, not 1-length");
    }
    int res = arr[1];
    free(arr);
    return res;
}