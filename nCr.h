#ifndef ESCAPE_NCR_H_
#define ESCAPE_NCR_H_

// #include <fstream>
// #include <sstream>

#include <stdio.h>

// using namespace std;

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
// {
//     std::ifstream file;
//     std::string ifname = "../Escape/nCr.txt";
//     std::cout << ifname << std::endl;
//     file.open(ifname);
//     if (!file.is_open())
//     {
//         std::cout << "Could not open output file." << std::endl;
//         return;
//     }
//     std::cout << "In populate_nCr" << std::endl;


//     for(int row = 0; row < 1001; ++row)
//     {
//         std::string line;
//         std::getline(file, line);
//         if ( !file.good() )
//             break;

//         std::stringstream iss(line);

//         for (int col = 0; col < 401; ++col)
//         {
//             std::string val;
//             std::getline(iss, val, ',');
//             if ( !iss.good() )
//                 break;
//             // std::cout << "val = " << val << std::endl;

//             std::stringstream convertor(val);
//             convertor >> nCr[row][col];
//             // std::cout << nCr[row][col] << " ";
//         }
//         //std::cout << std::endl;
//     }
// }


#endif
