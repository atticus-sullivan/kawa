#include <stdio.h>
#include <string.h>
#include <curl/curl.h>

#include "config.h"
#include "datatypes.h"

int sync_repo(char reponame[], char repourl[]);
int sync_all();
