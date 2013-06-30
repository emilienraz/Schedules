param N;

param D;

param C;

param E;

param Profs{1..7,1..20}, integer, >=0;

param Heures{1..11,1..21}, integer, >=0;


/*Emploi du temps par classe*/
var x{i in 1..10, j in 1..N, k in 1..C}, binary, >=0; 

s.t. fa{i in 1..D}: sum{j in 1..N,k in 1..C} x[i,j,k] == Heures[i,21];

s.t. fb{k in 1..C}: sum {i in 1..D,j in 1..N} x[i,j,k] == Heures[11,k];


/*Nombre d'heures par cours et classe 1*/

s.t. fc{k in 1..C}: sum {j in 1..N} x[1,j,k] == Heures[1,k];


/*Nombre d'heures par cours et classe 2*/

s.t. fd{k in 1..C}: sum {j in 1..N} x[2,j,k] == Heures[2,k];


/*Nombre d'heures par cours et classe 3*/

s.t. fe{k in 1..C}: sum {j in 1..N} x[3,j,k] == Heures[3,k];

/*Nombre d'heures par cours et classe 4*/

s.t. ff{k in 1..C}: sum {j in 1..N} x[4,j,k] == Heures[4,k];

/*Nombre d'heures par cours et classe 5*/

s.t. fg{k in 1..C}: sum {j in 1..N} x[5,j,k] == Heures[5,k];

/*Nombre d'heures par cours et classe 6*/

s.t. fh{k in 1..C}: sum {j in 1..N} x[6,j,k] == Heures[6,k];

/*Nombre d'heures par cours et classe 7*/

s.t. fi{k in 1..C}: sum {j in 1..N} x[7,j,k] == Heures[7,k];

/*Nombre d'heures par cours et classe 8*/

s.t. fj{k in 1..C}: sum {j in 1..N} x[8,j,k] == Heures[8,k];

/*Nombre d'heures par cours et classe 9*/

s.t. fk{k in 1..C}: sum {j in 1..N} x[9,j,k] == Heures[9,k];

/*Nombre d'heures par cours et classe 10*/

s.t. fl{k in 1..C}: sum {j in 1..N} x[10,j,k] == Heures[10,k];

/* Sous contrainte pour que deux cours ne se déroulent pas en même temps pour une même classe*/

s.t. fm{i in 1..D, j in 1..N}: sum {k in 1..C} x[i,j,k] <=1;


/* sous contrainte de profs*/

s.t. fn{j in 1..N,k in 1..C}: sum {i in 1..D} x[i,j,k] <= Profs[7,k];


maximize obj: sum{i in 1..D, j in 1..N-6, k in 1..C} x[i,j,k];

solve;
 
for{ i in 1..D}
{
	printf "Emploi du temps de la classe n° %2d\n", i;
	printf ("                  |       Lundi       |   |       Mardi       |   |      Mercredi     |");
	printf ("   |       Jeudi       |   |     Vendredi      |\n");
	printf ("                  9h 10h 11h 12h 14h 15h  9h 10h 11h 12h 14h 15h  9h 10h 11h 12h 14h 15h  ");
	printf ("9h 10h 11h 12h 14h 15h  9h 10h 11h 12h 14h 15h\n");
	printf ("                  |                   |   |                   |   |                   |");
	printf ("   |                   |   |                   |");
 	for{k in 1..C}
	{

		printf "\nMatiere n° %2d-> ",k;
		for{j in 1..N}
	 	{
			printf " %2d ", x[i,j,k];
		} 
	printf "\n";
	}
printf("\n\n");
}

end;