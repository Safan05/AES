module ShiftRows(input [0:127]a,output reg[0:127]s);
always@(*)begin
s[0:7] = {a[0:7]};
s[32:39] = {a[32:39]};
s[64:71] = {a[64:71]};
s[96:103] = {a[96:103]};
//2nd row
s[8:15] = {a[40:47]};
s[40:47] = {a[72:79]};
s[72:79] = {a[104:111]};
s[104:111] = {a[8:15]};
//3rd row
s[16:23] = {a[80:87]};
s[48:55] = {a[112:119]};
s[80:87] = {a[16:23]};
s[112:119] = {a[48:55]};
//4th row
s[24:31] = {a[120:127]};
s[56:63] = {a[24:31]};
s[88:95] = {a[56:63]};
s[120:127] = {a[88:95]};
end
endmodule

module encrypt#(parameter nk=4,parameter nr=10)(input [0:127]in ,output [0:127]out,input [0:128*(nr+1)-1] key_e);  // nb*(nr+1) words where nb always = 4 and 1 word = 4 bytes = 32 bit so 32*4=128
wire [0:127]state;
endmodule
