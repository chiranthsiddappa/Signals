
module gold_code_generator
  #(parameter M = 3)
   (
    input wire 	clock;
    input wire 	reset;
    output wire sync_bit;
    output wire output_bit;
    );

   reg [M - 1 :0] 	sync_mask;
   reg [M - 1 :0] 	mask;
   reg [M - 1 :0] 	SR;
   
   always @ (posedge clock) begin
      if(!reset) begin
	 sync_bit = 1'b0;
	 case(M)
	   3: mask = 10'b011;
	   4: mask = 10'b0011;
	   5: mask = 10'b00101;
	   6: mask = 10'b000011;
	   7: mask = 10'b0001001;
	   8: mask = 10'b00011101;
	   9: mask = 10'b000010001;
	   10: mask = 10'b00001001;
	 endcase // case (M)
	 SR = M - 1;
      end // if (!reset)
      output_bit = ^(SR ^ mask);
      SR[M - 1 :1] = SR[M - 1 : 1];
      SR[0] = output_bit;
   end // always @ (posedge clock)

endmodule