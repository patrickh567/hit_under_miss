module ainv_checker
  #(parameter `BSG_INV_PARAM(data_width_p))
  (
    input clk_i
    , input reset_i

    , input en_i
  
    , input [data_width_p-1:0] data_o
    , input v_o
    , input yumi_i
  );


  // ainv test is setup in such way that it should only return zero.

  always_ff @ (posedge clk_i) begin
  
    if (~reset_i & en_i & v_o & yumi_i)
      assert(data_o == '0)
        else $fatal(1, "zero output expected.");

  end

endmodule

`BSG_ABSTRACT_MODULE(ainv_checker)
