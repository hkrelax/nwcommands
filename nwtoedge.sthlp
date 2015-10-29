{smcl}
{* *! version 1.0.1  16may2012 author: Thomas Grund}{...}
{marker topic}
{helpb nw_topical##import:[NW-2.2] Import/Export}

{title:Title}

{p2colset 9 18 22 2}{...}
{p2col :nwtoedge {hline 2} Convert networks to edgelist}
{p2colreset}{...}


{title:Syntax}

{p 8 17 2}
{cmdab: nwtoedge} 
[{it:{help netlist}}]
[{cmd:,}
{opth egovars(varlist)}
{opth altervars(varlist)}
{opth ego(newvarname)}
{opth alter(newvarname)}
{opt compress}]
		
{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{synopt:{opth egovars(varlist)}}keeps attributes of sending nodes{p_end}
{synopt:{opth altervars(varlist)}}keeps attributes of receiving nodes {p_end}
{synopt:{opth ego(newvarname)}}sender of ties; default = {it:_nwego}{p_end}
{synopt:{opth alter(newvarname)}}receiver of ties; default = {it:_nwalter}{p_end}

{p2colreset}{...}


{title:Description}

{pstd}
{cmd:nwtoedge} makes an edgelist out of a network or a list of networks. 

{pstd}
An edgelist of a single network {help netname} produced by {cmd:nwtoedge} is a set of three variables representing
the relations in the network. The first variable ({it:_nwego}) gives the {help nodelab}
of the sending node {it:i} of a relationship; the second variable ({it:_nwalter}) gives the {help nodelab} of the 
receiving node {it:j}. Lastly, a variable {it:netname} saves information about the 
dyad pair ({it:i},{it:j}) in the network {it:netname}.

{pstd}
When the command is used with a {help netlist}, it generates one new variable for each network {it:netname} in the list.

{pstd}
One can also specify which attribute variables should be included in the new dataset. Option {opt egovars()} 
generates new variables that match the attributes of the sender of a tie; option {opt altervars()} 
generates new variables that match the attributes of the receiver of a tie.

{pstd}
For example, 

	{cmd:. webnwuse glasgow1}
	{com}. nwtoedge glasgow1, egovars(sport1)
	{com}. list
{txt}
      {c TLC}{hline 9}{c -}{hline 7}{c -}{hline 10}{c -}{hline 13}{c TRC}
      {c |} {res}_fromid   _toid   glasgow1   from_sport1 {txt}{c |}
      {c LT}{hline 9}{c -}{hline 7}{c -}{hline 10}{c -}{hline 13}{c RT}
   1. {c |} {res}      1       1          0       regular {txt}{c |}
   2. {c |} {res}      1       2          0       regular {txt}{c |}
   3. {c |} {res}      1       3          0       regular {txt}{c |}
   4. {c |} {res}      1       4          0       regular {txt}{c |}
   5. {c |} {res}      1       5          0       regular {txt}{c |}
      {c LT}{hline 9}{c -}{hline 7}{c -}{hline 10}{c -}{hline 13}{c RT}
   6. {c |} {res}      1       6          0       regular {txt}{c |}
		.....
      {c LT}{hline 9}{c -}{hline 7}{c -}{hline 10}{c -}{hline 13}{c RT}
  11. {c |} {res}      1      11          1       regular {txt}{c |}
  12. {c |} {res}      1      12          0       regular {txt}{c |}
  13. {c |} {res}      1      13          0       regular {txt}{c |}
  14. {c |} {res}      1      14          1       regular {txt}{c |}
  15. {c |} {res}      1      15          0       regular {txt}{c |}
      {c LT}{hline 9}{c -}{hline 7}{c -}{hline 10}{c -}{hline 13}{c RT}
		.....	  
	  
{pstd}
loads the {help netexample:Glasgow data} and transforms the network {it:glasgow1} in an edgelist. For example, {it:glasgow1[11] = 1} means,
that there is a network tie from node 1 to node 11. It also generates a new variable {it:from_sport1},
which holds information about how often the sender of a tie does sport in wave1.				 

{pstd}
The command can also transform two networks in edgelists at the same. When more than one {help netname} is given, the command 
automatically invokes option {opt full}:

	{cmd:. nwtoedge glasgow1 glasgow2}
	
{pstd}
This generates a datset with one variable for each network, {it:glasgow1} and {it:glasgow2}:

	{com}. list
{txt}
      {c TLC}{hline 9}{c -}{hline 7}{c -}{hline 10}{c -}{hline 10}{c TRC}
      {c |} {res}_fromid   _toid   glasgow1   glasgow2 {txt}{c |}
      {c LT}{hline 9}{c -}{hline 7}{c -}{hline 10}{c -}{hline 10}{c RT}
   1. {c |} {res}      1       1          0          0 {txt}{c |}
   2. {c |} {res}      1       2          0          0 {txt}{c |}
   3. {c |} {res}      1       3          0          0 {txt}{c |}
   4. {c |} {res}      1       4          0          0 {txt}{c |}
   5. {c |} {res}      1       5          0          0 {txt}{c |}
      {c LT}{hline 9}{c -}{hline 7}{c -}{hline 10}{c -}{hline 10}{c RT}
   6. {c |} {res}      1       6          0          0 {txt}{c |}
   7. {c |} {res}      1       7          0          0 {txt}{c |}
   8. {c |} {res}      1       8          0          0 {txt}{c |}
   9. {c |} {res}      1       9          0          0 {txt}{c |}
  10. {c |} {res}      1      10          0          1 {txt}{c |}
      {c LT}{hline 9}{c -}{hline 7}{c -}{hline 10}{c -}{hline 10}{c RT}
  11. {c |} {res}      1      11          1          0 {txt}{c |}
  12. {c |} {res}      1      12          0          0 {txt}{c |}
  13. {c |} {res}      1      13          0          0 {txt}{c |}
  14. {c |} {res}      1      14          1          1 {txt}{c |}
  15. {c |} {res}      1      15          0          0 {txt}{c |}
 		.....	
		
  
{title:Also see}
	
	{help nwfromedge}, {help nwsave}
