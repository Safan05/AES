module aes(output check,output [6:0]HEX1,output [6:0]HEX2,output [6:0]HEX3);
reg [127:0]in=128'h3243f6a8885a308d313198a2e0370734;
reg [255:0]key_256=256'h603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4;
wire [127:0]encrypted;
reg [127:0] temp_encrypted;
wire [127:0]decrypted;
parameter s=2;
generate
	if(s==0) begin // if switch is 0 use the 128
		encrypt a(in,encrypted,Key_128);
		reg[127:0]key_128=key_256[255:128]; // takes the most significant 128 bits of key_256
		//temp_encrypted=encrypted;
		decrypt b(encrypted,decrypted,key_128);
	end
	else if(s==1)begin // if the witch is 1 use 196
		reg[195:0]key_196=key_256[255:60]; // takes the most significant 196 bits of key_256
		encrypt #(6,12,196) c(in,encrypted,Key_196);
		//temp_encrypted=encrypted;
		decrypt #(6,12,196) d(encrypted,decrypted,key_196);
	end
	else begin	// if the switch is 2 or 3 use 256
		//reg [255:0]key_all=key_256[255:0]; // takes all the key
		encrypt #(8,14,256) e(in,encrypted,Key_256);
		//temp_encrypted=encrypted;
		decrypt #(8,14,256) f(encrypted,decrypted,key_256);
	end
	endgenerate
	always@(*)
			if(decrypted==in)
			check=1'b1;
		else
			check=1'b0;	
endmodule

