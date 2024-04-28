module ShiftRows_inv (input[0:127] in , output reg[0:127] out);
 
always@(*)
 begin
 //row1
   out[0:7]=in[0:7];
   out[32:39]=in[32:39];
   out[64:71]=in[64:71];
   out[96:103]=in[96:103];
 //row2	 
   out[8:15]=in[104:111];
   out[40:47]=in[8:15];
   out[72:79]=in[40:47];
   out[104:111]=in[72:79];
 //row3	 
   out[16:23]=in[80:87];
   out[48:55]=in[112:119];
   out[80:87]=in[16:23];
   out[112:119]=in[48:55];
 //row4	 
   out[24:31]=in[56:63];
   out[56:63]=in[88:95];
   out[88:95]=in[120:127];
   out[120:127]=in[24:31];
 end
endmodule