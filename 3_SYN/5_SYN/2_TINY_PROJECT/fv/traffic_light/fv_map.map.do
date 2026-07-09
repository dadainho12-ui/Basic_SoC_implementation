
//input ports
add mapped point clk clk -type PI PI
add mapped point rst_n rst_n -type PI PI

//output ports
add mapped point o_red o_red -type PO PO
add mapped point o_left o_left -type PO PO
add mapped point o_green o_green -type PO PO
add mapped point o_yellow o_yellow -type PO PO

//inout ports




//Sequential Pins
add mapped point state[0]/q state_reg[0]/Q -type DFF DFF
add mapped point state[1]/q state_reg[1]/Q -type DFF DFF
add mapped point cnt[2]/q cnt_reg[2]/Q -type DFF DFF
add mapped point cnt[1]/q cnt_reg[1]/Q -type DFF DFF
add mapped point cnt[0]/q cnt_reg[0]/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
