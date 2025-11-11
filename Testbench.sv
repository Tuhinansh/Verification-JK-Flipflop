`include "design.sv"
`include "jk_interface.sv"
`include "transaction.sv"
`include "driver.sv"
`include "monitor.sv"

module testbench;
    jk_if jk_if_inst(); // Instantiate the interface

    // Design under test (DUT)
    jk_flip_flop dut (
        .J(jk_if_inst.J),
        .K(jk_if_inst.K),
        .clk(jk_if_inst.clk),
        .reset(jk_if_inst.reset),
        .Q(jk_if_inst.Q),
        .Qn(jk_if_inst.Qn)
    );

    // Clock generation
    initial jk_if_inst.clk = 0;
    always #5 jk_if_inst.clk = ~jk_if_inst.clk;

    // Testbench components
    jk_driver driver; 
    jk_monitor monitor; 
    int num_tests = 10; // Number of test cases

    initial begin
        // Enable VCD dumping
        $dumpfile("dump.vcd");  // Specify the VCD file name
        $dumpvars(0, testbench); // Dump all variables in the testbench scope

        // Initialize the environment
        driver = new(jk_if_inst, num_tests); 
        monitor = new(jk_if_inst, num_tests); 

        // Reset the DUT
        jk_if_inst.reset = 1;  // Assert reset
        #10 jk_if_inst.reset = 0;  // Deassert reset

        // Run the components
        fork
            driver.run();     // Driver runs tests
            monitor.run();    // Monitor observes and logs results
        join

        // End simulation after a delay
        #100 $finish;
    end
endmodule
