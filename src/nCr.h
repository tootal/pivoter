#ifndef ESCAPE_NCR_H_
#define ESCAPE_NCR_H_

#include <stdio.h>


double nCr[1001][401];

void populate_nCr()
{
    FILE *infile;
    infile = fopen("nCr.txt","r");
    double d;
    
    for(int row = 0; row < 1001; ++row)
    {
        for (int col = 0; col < 401; ++col)
        {
            fscanf(infile,"%lf",&d);
            nCr[row][col] = d;
        }
    }
}



#endif
