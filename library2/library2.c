#include <repo2/library2/public/library2.h>
#include <repo1/library1/public/library1.h>

#include <stdio.h>




void repo2_library2_display()
{
    printf("repo2_library2_display: 1\n");

    repo1_library1_display();

    printf("repo2_library2_display: 2\n");
}