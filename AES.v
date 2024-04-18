module aes();
reg [0:127]in=128'h3243f6a8885a308d313198a2e0370734;
wire [0:256]key=128'h2b7e151628aed2a6abf7158809cf4f3c;
wire[0:127]encrypted ;
wire[0:127]decrypted ;
reg check=1'b1;
wire [0:128*(nr+1)-1]w;
reg [0:128*(nr+1)-1] k;
KeyExpansion gen(key,w); // returning the generated key in wire w
k=w;
encrypt a(in,encrypted,k);
decrypt b(encrypted,decrypted,k); // 128 bit key length operation
encrypt a#(6,12)(in,encrypted,k); // nk=6,nr=12
decrypt b#(6,12)(encrypted,decrypted,k); // 196 bit key length operation
encrypt a#(8,14)(in,encrypted,k);		  // nk=8,nr=14
decrypt b#(8,14)(encrypted,decrypted,k); // 256 bit key length operation
always @*
for (integerj=0;j<128;j=j+1)
if(in[j]!=decrypted[j])
check=0;
endmodule