module traffic_light(
    input clk,
    input rst,
    output reg red,
    output reg yellow,
    output reg green
);

parameter RED    = 2'b00;
parameter GREEN  = 2'b01;
parameter YELLOW = 2'b10;

reg [1:0] state;

always @(posedge clk or posedge rst)
begin
    if(rst)
        state <= RED;
    else
    begin
        case(state)
            RED:    state <= GREEN;
            GREEN:  state <= YELLOW;
            YELLOW: state <= RED;
            default: state <= RED;
        endcase
    end
end

always @(*)
begin
    red    = 0;
    yellow = 0;
    green  = 0;

    case(state)
        RED:    red    = 1;
        GREEN:  green  = 1;
        YELLOW: yellow = 1;
    endcase
end

endmodule
