#ifndef __INTERPRETER_H__
#define __INTERPRETER_H__

#include "uthash.h"

struct Idtf {
    char name[128];
    int val;
    UT_hash_handle hh;
};

int *arrCreate(int n);
int *arrMulti(int *oldArr, int n);
void printFree(int *arr);
void printList(int *arr);
void freeList(int *arr);
int *concatList(int *arr1, int *arr2);
int *appendList(int *n, int *arr);
int setId(char *name, int *arr);
int getId(char *name);
void freeHashTable(void);
int strCheck(char *str);

void printError(int *arr, const char *msg);

int addArr(int *arr);
int subArr(int *arr);
int mulArr(int *arr);
int divArr(int *arr);
int dbmArr(int *arr);
int ifArr(int cond, int *arr);
int dspArr(int *arr);
int equArr(int *arr);
int lssArr(int *arr);
int getVal(int *arr);

#endif