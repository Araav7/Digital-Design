module draw_circle(
    input [11:0] horz,
    input [11:0] vert,
    input [20:0] sample,
    input [1:0] size,
    output condition,
    output [3:0]green_radius,
    output [3:0]red_radius,
    output [3:0]blue_radius
    );
    
    wire [11:0] x;
    wire [11:0] y;
    wire [2:0] r;
    assign x = (size == 1) ? 1120 :
                    {(size == 2) ? 480 :
                        {(size == 3) ? 640 : 0}};
    assign y = 512;
    assign r = (size == 1) ? 4 : 1;
    wire [20:0] circle = sample / 3;
    
    
    assign condition  = (size == 0) ? 0 : ((horz - x)**2 + (vert - y)**2) < (sample/r)**2;
    wire radius40 = ((horz - x)**2 + (vert - y)**2) < (40/r)**2;
    wire radius120 = ((horz - x)**2 + (vert - y)**2) < (120/r)**2;
    wire radius200 = ((horz - x)**2 + (vert - y)**2) < (200/r)**2;
    wire radius280 = ((horz - x)**2 + (vert - y)**2) < (280/r)**2;
    wire radius360 = ((horz - x)**2 + (vert - y)**2) < (360/r)**2;
    wire radius440 = ((horz - x)**2 + (vert - y)**2) < (440/r)**2;
    assign green_radius = (radius40) ? 4 : 
                            {(radius120) ? 6 : 0};
    assign blue_radius = (radius200) ? 8 :
                            {(radius280) ? 10 : 0};
    assign red_radius =  (radius360) ? 12 :
                            {(radius440) ? 15 : 0};
    
endmodule
