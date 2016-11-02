//***********************
//Simulated annealing algorithm
//2015 10  06
//(c) 
//************************
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <assert.h>

using namespace std;
double randmax=RAND_MAX; //37768?
//calculation of solution energy
double energy(double x){
	double e=5*pow(x,2)-pow(x,3)+1;
	return e;
}
//random numbers calculation
double randx(){
	return (rand()/randmax)*8-3;
}
//Calculation of probability
double probability(double deltaE, double T){
	return exp(-deltaE/T);
}
int main(){
	// Debuging ***
	//cout<<energy(0)<<endl;
	//for  (int f=0; f<20; f++){
	//	cout <<randx()<< endl;
	//	}
	//***
	double T=30;
	double alpha=0.97;
	double p;
	double xcur=randx();
	double xwork;
	double ecur, ework;
	double deltaE,accept=0;
	for (double t=T;t>0.5;t=alpha*t){
		for (int j=1; j<20; j++){
			ecur=energy(xcur);
			xwork=randx();
			ework=energy(xwork);
			deltaE=ework-ecur;
			if(deltaE<0){
				xcur=xwork;
			}
			else{
				p=probability(deltaE,t);
				if (p>(rand()/randmax)){
					xcur=xwork;
					cout <<"Accepted"<<endl;
					accept++;
				}
				
			}
			cout <<"t,xwork,xcur,ework,ecur,accepted =" <<t<<","<<xwork<<","<<xcur<<","<<ework<<","<<ecur<<","<<accept<<","<<endl;
			accept=0;
		}
		
		
	}
	cout <<"The global minimum is (xcur, Energy)" <<xcur<<","<<ecur<<endl;
	cout <<"The program is finished!!! Way!!!"<<endl;
	cin.get();
	return 0;	
	
}
