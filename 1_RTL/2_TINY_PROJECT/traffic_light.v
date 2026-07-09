`timescale 1ns / 1ps

module traffic_light (

    // Port List
    clk         ,
    rst_n       ,

    o_red       ,
    o_left      ,
    o_green     ,
    o_yellow

);

//--------------------------------------------------
// Port Declaration
//--------------------------------------------------

input   clk		;
input   rst_n		;

output  o_red		;
output  o_left		;
output  o_green		;
output  o_yellow	;

//--------------------------------------------------
// State Definition
//--------------------------------------------------

parameter RED             = 2'b00;
parameter STRAIGHT_LEFT   = 2'b01;
parameter STRAIGHT        = 2'b10;
parameter YELLOW          = 2'b11;

//--------------------------------------------------
// Internal Register
//--------------------------------------------------

reg [1:0] state	;
reg [1:0] next	;

reg [2:0] cnt	;

reg timer_done	;

//==================================================
// 1. Current State Register
//==================================================

always @(posedge clk or negedge rst_n)
begin

    if(!rst_n)
        state <= RED	;

    else
        state <= next	;

end

//==================================================
// 2. Timer Counter
//==================================================

always @(posedge clk or negedge rst_n)
begin

    if(!rst_n)
        cnt <= 3'd0		;

    else if(timer_done)
        cnt <= 3'd0		;

    else
        cnt <= cnt + 1'b1	;

end

//==================================================
// 3. Timer Done Logic
//==================================================

always @(*)
begin

    case(state)

        RED :
            timer_done = (cnt == 3'd4)	;      // 5 clock

        STRAIGHT_LEFT :
            timer_done = (cnt == 3'd2)	;      // 3 clock

        STRAIGHT :
            timer_done = (cnt == 3'd6)	;      // 7 clock

        YELLOW :
            timer_done = (cnt == 3'd1)	;      // 2 clock

        default :
            timer_done = 1'b0		;

    endcase

end

//==================================================
// 4. Next State Logic
//==================================================

always @(*)
begin

    case(state)

        RED :
        begin

            if(timer_done)
                next = STRAIGHT_LEFT	;
            else	
                next = RED		;

        end

        STRAIGHT_LEFT :
        begin

            if(timer_done)
                next = STRAIGHT		;
            else
                next = STRAIGHT_LEFT	;

        end

        STRAIGHT :
        begin

            if(timer_done)
                next = YELLOW		;
            else
                next = STRAIGHT		;

        end

        YELLOW :
        begin

            if(timer_done)
                next = RED		;
            else
                next = YELLOW		;

        end

        default :
            next = RED			;

    endcase

end

//==================================================
// 5. Output Logic (Moore FSM)
//==================================================

reg     o_red           ;
reg     o_left          ;
reg     o_green         ;
reg     o_yellow        ;


always @(*)
begin

    o_red      = 1'b0;
    o_left     = 1'b0;
    o_green    = 1'b0;
    o_yellow   = 1'b0;

    case(state)

        RED :
        begin
            o_red 	= 1'b1;
        end

        STRAIGHT_LEFT :
        begin
            o_left  	= 1'b1;
            o_green 	= 1'b1;
        end

        STRAIGHT :
        begin
            o_green 	= 1'b1;
        end

        YELLOW :
        begin
            o_yellow	= 1'b1;
        end

    endcase

end

endmodule
