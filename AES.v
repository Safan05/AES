module aes(check_128,check_196,check_256);
reg [127:0]in=128'h3243f6a8885a308d313198a2e0370734;
wire [127:0]key_128=128'h2b7e151628aed2a6abf7158809cf4f3c;
wire [195:0]key_196=196'h8e73b0f7da0e6452c810f32b809079e562f8ead2522c6b7b;
wire [255:0]key_256=256'h603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4c;
wire[127:0]encrypted_128 ;
wire[127:0]decrypted_128 ;
wire[127:0]encrypted_196 ;
wire[127:0]decrypted_196 ;
wire[127:0]encrypted_256 ;
wire[127:0]decrypted_256 ;
output check_128;
output check_196;
output check_256;
wire [0:128*(11)-1]w_128;
reg [0:128*(11)-1] k_128;
KeyExpansion gen128(key_128,w_128); // returning the generated 128 bit key in wire w
assign k_128=w_128;
wire [0:128*(13)-1]w_196;
reg [0:128*(13)-1] k_196;
KeyExpansion #(6,12)gen196(key_196,w_196); // returning the generated 196 bit key in wire w
assign k_196=w_196;
wire [0:128*(15)-1]w_256;
reg [0:128*(15)-1] k_256;
KeyExpansion #(8,14)gen256(key_256,w_256); // returning the generated 256 bit key in wire w
assign k_256=w_256;
encrypt a(in,encrypted_128,k_128);
decrypt b(encrypted_128,decrypted_128,k_128); // 128 bit key length operation
encrypt #(6,12) c(in,encrypted_196,k_196); // nk=6,nr=12
decrypt #(6,12) d(encrypted_196,decrypted_196,k_196); // 196 bit key length operation
encrypt #(8,14) e(in,encrypted_256,k);		  // nk=8,nr=14
decrypt #(8,14) f(encrypted_256,decrypted_256,k); // 256 bit key length operation
always @*
begin
if(in==decrypted_128)
check_128=1;
if(in==decrypted_196)
check_196=1;
if(in==decrypted_256)
check_256=1;
end
endmodule