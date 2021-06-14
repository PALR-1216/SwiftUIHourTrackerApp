//
//  main.cpp
//  GUI
//
//  Created by Pedro Alejandro on 3/13/21.
//

#include <iostream>
#include <vector>
#include <string>
#include <iomanip>
#include <fstream>
#include <exception>



using namespace std;

//crear un sistema de recibop como en los fastfood
//TODO - crear un loop para ingresar los datos y los nombres de las compras
//TODO - ingresar la data en 2 arreglos 1 para los nombres y otros para el precio

void header();
void Final(float total, float salesTax, float grand_total);

int main()
{
    
    int items;
    int MAX = 0;
    float total = 0;
    double percentage;
    double tax;
    double grand_total;
    char receipt;
    ofstream file;
    file.open("example.txt");
    
    
    
    cout<<"How many sales items do you have?: ";
    cin>>items;
    string items_name[items];
    float prices[items];
    
    
    for(int count = 0; count < items; count++){
        cout<<"Enter the name of the sales item " << count + 1 << ": ";
        cin>>items_name[count];
        cout<<"Enter the prices of the item " << items_name[count] << ": $";
        cin>>prices[count];
        total = total + prices[count];
        cout<<endl;
        cout << "********************************************" << endl;
    }
    
    cout<<"Enter the amount of tax percentage: ";
    cin >> percentage;
    tax = total * (percentage / 100);
    grand_total = tax + total;
    

    cout<<endl;
    cout<<endl;
    cout<<endl;
    
    cout<<"__ITEM NAME__"<< setw(20)<< "__PRICE__"<<endl;
    cout << "=========================================" << endl;
    
    for(int count = 0; count < items; count++)
    {
        
        cout<<setprecision(2)<<fixed<<showpoint<<setw(2)<< items_name[count] <<setw(22)<< "$" << prices[count]<<endl;

    }

    cout << "=========================================" << endl;
    cout<<"Are all your Items correct (Y/N)?: ";
    cin>>receipt;
    
    if(receipt == 'Y' || receipt == 'y'){
        cout<<endl;
        cout<<endl;
        cout<<endl;
        header();
        Final(total, tax, grand_total);
        
    }

    
    
//    header();
//    Final(total, tax, grand_total);
}

void header()
{
    
//    cout << "********************************************" << endl;
//    cout << "********  S A L E S  R E C E I P T  ********" << endl;
//    cout << "********************************************" << endl;
//    cout << "**                                        **" << endl;
//    cout << "**                                        **" << endl;
    
}



void Final(float total, float tax, float grand)
{
   
    // cout<< "Total Sales: "<<setw(15) << " $" << total<<endl;
    // cout<<"Total Tax:" << setw(15) << " $" << tax << endl;
    // cout<<"Grand Total:" << setw(15) << " $" << grand << endl;

    cout<<setprecision(2) <<fixed << showpoint << "Total Sales:"  << setw(15) << "$" <<total<< endl;
    cout<< "Total Tax:"  << setw(15) << "$" <<tax<< endl;

    cout<< "Grand Total:"  << setw(15) << "$" <<grand<< endl;
    
}


