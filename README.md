These files contain the code for the algorithm for counting all cliques
given by Jain and Seshadhri in "The power of pivoting for exact clique counting." (WSDM 2020).

This code is a modified version of the code of quick-cliques-1.0 library for counting maximal cliques by Darren Strash (first name DOT last name AT gmail DOT com).

Original author: Darren Strash (first name DOT last name AT gmail DOT com)

Copyright (c) 2011 Darren Strash. This code is released under the GNU Public License (GPL) 3.0.

Modifications Copyright (c) 2020 Shweta Jain
August 16, 2019: Modified the code of quick-cliques-1.0 library to count all cliques (not just maximal).

This program is free software: you can redistribute it and/or modify 
it under the terms of the GNU General Public License as published by 
the Free Software Foundation, either version 3 of the License, or 
(at your option) any later version. 

This program is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
GNU General Public License for more details. 

You should have received a copy of the GNU General Public License 
along with this program.  If not, see <http://www.gnu.org/licenses/> 

-------------

This code can be used to calculate the number of global k-cliques, per-vertex k-cliques and per-edge k-cliques in a graph. 

*Getting the graph*

The graph is expected to be in the .edges format. This is a custom format that looks as follows:

403398 2443411
0 1
0 2

First line has 2 integers separated by a space. The first integer is n: number of vertices and second is m: number of edges. This line should be followed by m lines, each having 2 integers representing the end vertices of an edge, separated by a space.

The graph is expected to be simple (no loops or repeated edges) and undirected (0 1 and 1 0 should not both be there).

Graphs can be placed in the "graphs" folder.

The "python" folder has a python script (you may have to use python2.7) that can be used to convert a graph from the SNAP datasets given here: https://snap.stanford.edu/data/index.html into the .edges format. Download and untar the graph in the "graphs" folder and run:

python sanitize.py ../graphs <filename>
eg.:

python sanitize.py ../graphs email-Enron.txt
This will read the email-Enron.txt file from the "graphs" folder and write an email-Enron.edges in the same folder.

*Running the code*

From the main directory (that contains src, bin, results, graphs etc.) run

make

to compile.

To run the code, from the main directory, run the following command:

./degeneracy_cliques -i <file_path> -t <type> -k <max_clique_size> -d <data_flag>

where 

file_path: path to file 

type: A/V/E. A for just k-clique information, V for per-vertex k-cliques, E for per-edge k-cliques 

max_clique_size: max_clique_size. If 0, calculates for all k 

data_flag: 

0: prints global k-clique counts on the screen.

1: prints global k-clique counts on the screen. Depending on the "type" flag, the global counts may be calculated using local k-clique counts. Outputs stats to an output file

2: prints global k-clique counts on the screen. Outputs global, per-vertex or per-edge k-clique counts (depending on the "type" flag) to an output file 

eg.:

./bin/degeneracy_cliques -i graphs/email-Enron.edges -t V -d 1 -k 6

will count the number of k-cliques per vertex for k<=6 and store the information in email-Enron_V.txt file in "results" folder.

./bin/degeneracy_cliques -i graphs/email-Enron.edges -t A -d 1 -k 0

will count the number of k-cliques for all k and store the information in email-Enron_A.txt file in "results" folder.

./bin/degeneracy_cliques -i graphs/email-Enron.edges -t E -d 0 -k 0

will count the number of k-cliques per edge for all k but will not store the information in any file. Instead, it will simply print the total number of k-cliques obtained from the per-edge counts.

There can be some loss of precision (depending on whether storing the numbers as double is lossy) because of which for the t=V and t=E options, some values may show as non-integers but we ignore this as in most applications we do not care beyond first few significant digits.

The result files only store the non-zero values from the data.

Be careful when storing the information (esp. per-edge counts) to a result file as for some graphs the result file can become very large.

If you find any bugs or have any questions, please contact Shweta Jain (sjain12@ucsc.edu).