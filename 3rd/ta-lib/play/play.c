#include "ta_func.h"

void main(){
    double test[31]={0.14, 0.6, 1.2, 2, 0.5, 0.77, 2, 2.3, 4, 1.687,
          1.2, 2.2, 2.3, 3, 1.6, 2.9, 3.2, 4.12, 3, 3.2,
          4, 3.89, 2.33, 5, 4.23, 6, 6.1, 4.1834, 3.214, 4.1, 2.8};
    int begIdx;
    int outNB;
    double out[31]={0};
    
        
    
     if(TA_MA(0,30,test,14,TA_MAType_SMA,&begIdx,&outNB,out)==TA_SUCCESS){
        for (size_t i = 0; i < sizeof(out) / sizeof(double); i++)
        {
            printf("at %d: %f \n",i,out[i]);
        }
        
    }
    else{
        printf("Failed!");
    } 
}
